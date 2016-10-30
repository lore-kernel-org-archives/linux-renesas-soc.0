Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f53.google.com ([209.85.215.53]:35809 "EHLO
        mail-lf0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753299AbcJ3Sgz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 30 Oct 2016 14:36:55 -0400
Received: by mail-lf0-f53.google.com with SMTP id f134so84444639lfg.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 30 Oct 2016 11:36:54 -0700 (PDT)
Subject: R-Car gen2 PLL0/2/4 frequencies incorrect?
To: Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-renesas-soc@vger.kernel.org
References: <1580369.yToZzJza1l@wasted.cogentembedded.com>
 <13559419.B3v0G6vn24@wasted.cogentembedded.com>
 <CAMuHMdXt0yoHsk_BLpn+e8eqC+sz_VNV1xeOPPM4on=8i_Gb-Q@mail.gmail.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <33b8d2d9-5eab-b9c0-9b39-59d28aed7e6e@cogentembedded.com>
Date: Sun, 30 Oct 2016 21:36:50 +0300
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXt0yoHsk_BLpn+e8eqC+sz_VNV1xeOPPM4on=8i_Gb-Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

drivers/clk/renesas/rcar-gen3-cpg.c seems to forget that the PLL0/2/4 all have 
a fixed divisor (2) while it multiplies PLLxCR.STC with 2 for the 'mult' 
variable (see the manual). All the dependent frequencies this should be 
reported greater x2 than the actual ones...

MBR, Sergei
