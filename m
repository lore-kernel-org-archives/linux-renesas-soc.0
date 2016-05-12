Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:35403 "EHLO
	mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752132AbcELGpg (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 12 May 2016 02:45:36 -0400
MIME-Version: 1.0
In-Reply-To: <SG2PR06MB09190A986DDC6D2220603AA6D8730@SG2PR06MB0919.apcprd06.prod.outlook.com>
References: <1462859524-28522-1-git-send-email-horms+renesas@verge.net.au>
	<SG2PR06MB09190A986DDC6D2220603AA6D8730@SG2PR06MB0919.apcprd06.prod.outlook.com>
Date: Thu, 12 May 2016 08:45:35 +0200
Message-ID: <CAMuHMdWKu7wLDthh2QXKJBS_a7yz38HFbi4wSLMnWV0Y5qbbbQ@mail.gmail.com>
Subject: Re: [PATCH/RFC 0/3] UHS-I SDR-104 support for sh_mobile_sdhi
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Simon Horman <horms+renesas@verge.net.au>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>,
	Ben Hutchings <ben.hutchings@codethink.co.uk>,
	Ian Molton <ian@mnementh.co.uk>,
	Ulf Hansson <ulf.hansson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Shimoda-san,

On Thu, May 12, 2016 at 8:30 AM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> - I tried 3 Lager boards:
>  - One of board (No.701 / ES2.0) sometimes works correctly.
>   - " mmc1: tuning execution failed: -110" appeared.
>  - Other 2 boards (No.465 / ES2.0 and No.322 / ES3.0) always works correctly.
>
> Perhaps the issue is related to hardware problem.

Do they have the same U-Boot version?
Does the failing one have a newer U-Boot that disables unused MSTP clocks?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
