Return-Path: <kieranbingham@gmail.com>
From: Kieran Bingham <kieran@bingham.xyz>
Subject: R8A7795 FDP1 clock parentage
Cc: linux-renesas-soc@vger.kernel.org
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Message-ID: <57456546.5020104@bingham.xyz>
Date: Wed, 25 May 2016 09:41:42 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Morimoto-san,

I have added an initial patch to support the FDP1 in the clock
framework, but I have not been able to correctly identify the actual
clock parent.

For now I have assumed that it is R8A7795_CLK_S2D1.

Could you please confirm this selection, or help identify the true
parent please?
--
Regards

Kieran
