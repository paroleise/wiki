module MachinesHelper

  def content_nil?(content)
    #HACK:: 正規表現まとめる
    if content.gsub(/<(".*?"|'.*?'|[^'"])*?>/, "").gsub(/^(.+?)[\s　]+(.+)$/, "") == ""
      "hide"
    end
  end


  def decorate_diff(str1, str2)
    fixed_str1 = str1.gsub(/<(".*?"|'.*?'|[^'"])*?>/, "")
    fixed_str2 = str2.gsub(/<(".*?"|'.*?'|[^'"])*?>/, "")
    Diff::LCS.sdiff(fixed_str1, fixed_str2) {|context_change|
      if context_change.unchanged?
        context_change.old_element
      elsif !context_change.old_element.nil?
       "<span>#{context_change.old_element}</span>"
      end
    }.join('')
  end

  def be_diff?(str1, str2)
    str1 == str2
  end

end
