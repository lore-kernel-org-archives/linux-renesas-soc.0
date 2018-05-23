Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:43420 "EHLO
        mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932096AbeEWJB4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 May 2018 05:01:56 -0400
MIME-Version: 1.0
In-Reply-To: <20180517075650.gxmp5wrqcble5qua@ninjato>
References: <1526475916-13705-1-git-send-email-ulrich.hecht+renesas@gmail.com> <20180517075650.gxmp5wrqcble5qua@ninjato>
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Date: Wed, 23 May 2018 11:01:55 +0200
Message-ID: <CAO3366zkwoFAFjY++bsdhR7F86HnVxrBkspmb1VFPJokFvc94w@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: r8a77995: Add MSIOF device nodes
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-spi@vger.kernel.org,
        Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, May 17, 2018 at 9:56 AM, Wolfram Sang <wsa@the-dreams.de> wrote:
> On Wed, May 16, 2018 at 03:05:15PM +0200, Ulrich Hecht wrote:
>> From: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
>>
>> This patch adds MSIOF device nodes for the R8A77995 SoC.
>>
>> Signed-off-by: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
>> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>> [uli: remove unimplemented ref clock]
>> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
>
> Thanks, Uli!
>
> For the record: can you describe shortly which of these got tested with
> what setup? I don't know the Draak, so I don't know what is exposed.

MSIOF2 is conveniently hooked up to a 1x4 pin header (CN41), no
weird-ass Samtec connectors required. My testing covered sending some
data using spidev_test and watching the output on an oscilloscope
attached to MSIOF2_TXD (pin 3). Looks plausible.

CU
Uli
