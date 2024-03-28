// ========================
// === Global variables ===
// ========================
#let 字号 = (
  初号: 42pt,
  小初: 36pt,
  一号: 26pt,
  小一: 24pt,
  二号: 22pt,
  小二: 18pt,
  三号: 16pt,
  小三: 15pt,
  四号: 14pt,
  中四: 13pt,
  小四: 12pt,
  五号: 10.5pt,
  小五: 9pt,
  六号: 7.5pt,
  小六: 6.5pt,
  七号: 5.5pt,
  小七: 5pt,
)

#let 字体 = (
  // 仿宋: ("Times New Roman", "FangSong"),
  宋体: ("Times New Roman", "SimSun"),
  黑体: ("Times New Roman", "SimHei"),
  // 楷体: ("Times New Roman", "KaiTi"),
  // 代码: ("New Computer Modern Mono", "Times New Roman", "SimSun"),
)

#let counter-page = counter(page)

// ==================
// === Components ===
// ==================

#let cover(id-school, title-cn, title-en) = {
  let stroke = 0.02857em
  let brown = rgb("#872d26")

  {
    set text(size: 字号.四号)
    set par(leading: 20pt, first-line-indent: 0em)

    grid(
      columns: (50%, 50%),
      {
        set align(left)
        box[
          #set align(left)
          #text(font: 字体.宋体, stroke: stroke + brown)[分类号：]

          #text(font: 字体.宋体, stroke: stroke + brown)[密#h(1em)级：]
          #text(font: 字体.黑体, stroke: stroke)[公开]
        ]
      },
      {
        set align(right)
        box[
          #set align(left)

          #text(font: 字体.宋体, stroke: stroke + brown)[单位代码：10422]

          #text(font: 字体.宋体, stroke: stroke + brown)[学#h(2em)号：]
          #text(font: 字体.宋体, stroke: stroke, id-school)
        ]
      }
    )
  }
  v(1em)
  {
    set align(center)
    set text(size: 字号.三号)

    image("cover.png", width: 100%)
    v(-1em)
    text(font: 字体.黑体, size: 字号.三号, fill: brown)[（专业学位）]
    linebreak()
    text(font: 字体.宋体, size: 字号.小二, stroke: stroke + brown)[论文题目：]
    text(font: 字体.黑体, size: 字号.小二, stroke: stroke, title-cn)
    linebreak()
    text(font: 字体.宋体, size: 字号.小二, stroke: stroke, title-en)
  }
  v(1em)

  let fieldvalue(value) = [
    #set align(center)
    #set text(font: 字体.黑体, stroke: stroke)
    #grid(
      rows: (auto, auto),
      row-gutter: 0.2em,
      value,
      line(length: 100%, stroke: 1pt + brown)
    )
  ]

  {
    set align(center)
    set text(size: 字号.四号)
    grid(
      columns: (120pt, 120pt),
      row-gutter: 1em,
      text(font: 字体.宋体, stroke: stroke + brown)[作#h(1em)者#h(1em)姓#h(1em)名],
      fieldvalue([于 松 黎]),

      text(font: 字体.宋体, stroke: stroke + brown)[作#h(1em)者#h(1em)姓#h(1em)名],
      fieldvalue([于 松 黎]),

      text(font: 字体.宋体, stroke: stroke + brown)[作#h(1em)者#h(1em)姓#h(1em)名],
      fieldvalue([于 松 黎]),

      text(font: 字体.宋体, stroke: stroke + brown)[作#h(1em)者#h(1em)姓#h(1em)名],
      fieldvalue([于 松 黎]),
    )
  }

  pagebreak()
}

#let announcement() = {
  let utils-mapper = (x) => {
    x
    "_" * 9
    h(1em)
  }
  {
    {
      set align(center)
      set text(size: 字号.三号)
      [原 创 性 声 明]
    }
    {
      set text(size: 字号.四号)
      [本人郑重声明：所呈交的学位论文，是本人在导师的指导下，独立进行研究所取得的成果。除文中已经注明引用的内容外，本论文不包含任何其他个人或集体已经发表或撰写过的科研成果。对本文的研究作出重要贡献的个人和集体，均已在文中以明确方式标明。本声明的法律责任由本人承担。]
      v(1em)
      {
        set align(center)
        grid(
          columns: 3,
          // ..([论文作者签名：], [日期：],).map(utils-mapper)
          utils-mapper("论文作者签名："), h(3em), utils-mapper("日期：")
        )
      }
    }
  }
  v(10em)
  {
    {
      set align(center)
      set text(size: 字号.三号)
      [关于学位论文使用授权的声明]
    }
    {
      set text(size: 字号.四号)
      {
        [
          本人同意学校保留或向国家有关部门或机构送交论文的印刷件和电子版，允许论文被查阅和借阅；本人授权山东大学可以将本学位论文的全部或部分内容编入有关数据库进行检索，可以采用影印、缩印或其他复制手段保存论文和汇编本学位论文。

          (保密论文在解密后应遵守此规定)
        ]
      }
      v(1em)
      {
        set align(right)
        grid(
          columns: 3,
          ..([论文作者签名：], [导师签名：], [日  期：]).map(utils-mapper)
        )
      }
    }
  }
  pagebreak()
}

#let abstract-cn(abstract-cn-doc, abstract-cn-keywords) = {
  set page(
    header: locate(loc => {
      set align(center)
      set text(size: 字号.五号)
      [山东大学硕士学位论文]
      v(-1em)
      line(length: 100%, stroke: 1pt)
    }),
    footer: locate(loc => {
      set align(center)
      counter-page.display("I")
    })
  )
  counter-page.update(1)
  {
    set text(font: 字体.黑体, size: 字号.小三, weight: "semibold")
    set align(center)
    v(24pt)
    [摘 #h(2em) 要]
    v(18pt)
  }
  set par(justify: true)
  set text(size: 字号.小四)
  {
    set par(first-line-indent: 2em)

    abstract-cn-doc
  }
  {
    set par(first-line-indent: 0em)
    [关键词：]
    abstract-cn-keywords
  }
}

#let main(
  id-school: "",
  title-cn: "",
  title-en: "",
  abstract-cn-doc: [],
  abstract-cn-keywords: [],
  doc
  ) = {
  set align(top)
  set text(font: 字体.宋体, size: 字号.小四, lang: "zh")
  set par(leading: 1em, first-line-indent: 2em)
  set page(
    paper: "a4",
    margin: (top: 2.8cm, bottom: 2.5cm, left: 2.5cm, right: 2.5cm),
    // header: locate(loc => {
    //   let page-counter = counter(page)
    //   let matches = query(<__noheader__>, loc)
    //   let current = page-counter.at(loc)
    //   let has-label = matches.any(m =>
    //     page-counter.at(m.location()) == current
    //   )
    //
    //   if not has-label {
    //     set align(center)
    //     set text(size: 字号.五号)
    //     [山东大学硕士学位论文]
    //     v(-1em)
    //     line(length: 100%, stroke: 1pt)
    //   }
    // }),
    // footer: locate(loc => {
    //   let page-counter = counter(page)
    //   let current = page-counter.at(loc)
    //   if current.first() < 3 {
    //     return
    //   }
    //   if current.first() == 3 {
    //     page-counter.update(1)
    //   }
    //   set align(center)
    //   counter(page).display()
    // })
  )

  cover(id-school, title-cn, title-en)
  announcement()
  abstract-cn(abstract-cn-doc, abstract-cn-keywords)
  doc
}
