module MachinesHelper

  def content_nil?(content)
    #HACK:: 正規表現まとめる
    if content.gsub(/<(".*?"|'.*?'|[^'"])*?>/, "").gsub(/^(.+?)[\s　]+(.+)$/, "") == ""
      "hide"
    end
  end

end
