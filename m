Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:33056 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751635AbeAaUX1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 Jan 2018 15:23:27 -0500
Received: by mail-lf0-f67.google.com with SMTP id t139so22714784lff.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jan 2018 12:23:27 -0800 (PST)
To: Rob Herring <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk <linux-clk@vger.kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/2] Renesas R8A77980 CPG/MSSR clock support
Message-ID: <5b7895ac-11c1-ac2d-837b-56726bc6226a@cogentembedded.com>
Date: Wed, 31 Jan 2018 23:23:23 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

Here's the set of 2 patches against the 'clk-renesas' branch of Geert Uytterhoeven's
'renesas-drivers.git' repo.

[1/2] dt-bindings: clock: add R8A77980 CPG core clock definitions
[2/2] clk: renesas: cpg-mssr: add R8A77980 support

MBR, Sergei
