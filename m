Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f195.google.com ([209.85.208.195]:44116 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725797AbeLDTn5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Dec 2018 14:43:57 -0500
Received: by mail-lj1-f195.google.com with SMTP id k19-v6so16022941lji.11
        for <linux-renesas-soc@vger.kernel.org>; Tue, 04 Dec 2018 11:43:56 -0800 (PST)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2 0/4] Renesas R8A77980 CPG/MSSR RPC clock support
To: linux-renesas-soc@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk@vger.kernel.org
Message-ID: <cfd91d1f-3b1e-c6c4-0975-7aac09383fdf@cogentembedded.com>
Date: Tue, 4 Dec 2018 22:43:53 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

Here's the set of 4 patches against the 'clk-renesas' branch of Geert Uytterhoeven's
'renesas-drivers.git' repo. We're adding support for the R8A77980 CPG/MSSR RPC clocks...

[1/4] clk: renesas: rcar-gen3-cpg: factor out cpg_reg_modify()
[2/4] clk: renesas: rcar-gen3-cpg: add spinlock
[3/4] clk: renesas: rcar-gen3-cpg: add RPC clocks
[4/4] clk: renesas: r8a77980-cpg-mssr: add RPC clocks

MBR, Sergei
