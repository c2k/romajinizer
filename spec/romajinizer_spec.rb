#coding: utf-8
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Romajinizer" do
  it "should convert romaji or katakana to hiragana properly" do
    "tsukue".to_hiragana.should == "つくえ"
    "kinnyoubi".to_hiragana.should == "きんようび"
    "kin'youbi".to_hiragana.should == "きんようび"
    "konnya".to_hiragana.should == "こんや"
    "konnnichi".to_hiragana.should == "こんにち"
    "kaetta".to_hiragana.should == "かえった"
    "アロハ".to_hiragana.should == "あろは"
    "".to_hiragana.should == ""
  end

  it "should convert romaji or hiragana to katakana properly" do
    "tsukue".to_katakana.should == "ツクエ"
    "kinnyoubi".to_katakana.should == "キンヨウビ"
    "つくえ".to_katakana.should == "ツクエ"
    "行きます".to_katakana.should == "行きます"
    "".to_katakana.should == ""
  end

  it "should convert kana to romaji properly" do
    "つくえ".to_romaji.should == "tsukue"
    "きんようび".to_romaji.should == "kinyoubi"
    "こんや".to_romaji.should == "konya"
    "こんにち".to_romaji.should == "konnichi"
    "ツクエ".to_romaji.should == "tsukue"
    "aloha".to_romaji.should == "aloha"
    "".to_romaji.should == ""
  end

  it "should normalize n" do
    "こんばn".to_hiragana.should == "こんばん"
    "konnbann".to_hiragana.should == "こんばん"
  end

  it "should convert kana to kana" do
    "あろは".kana2kana.should == "アロハ"
    "アロハ".kana2kana.should == "あろは"
    "aloha".kana2kana.should == "aloha"
    "アロハみな様genki!?!".kana2kana.should == "あろはミナ様genki!?!"
  end

  it "should be able to tell if a string contains kana" do
    "行きます".contains_kana?.should == true
    "abcdefg".contains_kana?.should == false
    "アロハeverybody".contains_kana?.should == true
    "あろはeverybody".contains_kana?.should == true
  end

  it "should be able to tell if a character or string are kana" do
    "す".is_kana?.should == true
    "すし".is_kana?.should == true
    "アロハ".is_kana?.should == true
    "行".is_kana?.should == false
    "sushi".is_kana?.should == false
    "アロハeverybody".is_kana?.should == false
  end

  it "should be able to tell if a character or string is hiragana" do
    "あ".is_hiragana?.should == true
    "ア".is_hiragana?.should == false
    "a".is_hiragana?.should == false
    "あろは".is_hiragana?.should == true
    "あロは".is_hiragana?.should == false
  end

  it "should be able to tell if a character or string is katakana" do
    "あ".is_katakana?.should == false
    "ア".is_katakana?.should == true
    "a".is_katakana?.should == false
    "アろは".is_katakana?.should == false
    "アロハ".is_katakana?.should == true
  end

  it "should be able to tell if a character or string is kanji" do
    "行".is_kanji?.should == true
    "あ".is_kanji?.should == false
    "ア".is_kanji?.should == false
    "〜".is_kanji?.should == false
    "a".is_kanji?.should == false
    "アロハ".is_kanji?.should == false
    "金曜日".is_kanji?.should == true
    "金曜日だ〜".is_kanji?.should == false
  end

end
