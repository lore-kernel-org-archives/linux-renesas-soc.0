Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <Jose.Abreu@synopsys.com>
Subject: Re: [PATCH v2 16/29] drm: bridge: dw-hdmi: Detect PHY type at runtime
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jose Abreu
	<Jose.Abreu@synopsys.com>
References: <20161220013400.28317-1-laurent.pinchart+renesas@ideasonboard.com>
 <6935724.YkYy7FE9s6@avalon>
 <5e1041ec-dd9e-4cbf-f2d3-1bd17595adaf@synopsys.com>
 <3716714.KhkP0QV9QI@avalon>
CC: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	<dri-devel@lists.freedesktop.org>, Andy Yan <andy.yan@rock-chips.com>, Fabio
 Estevam <fabio.estevam@freescale.com>, Kieran Bingham
	<kieran.bingham@ideasonboard.com>, Russell King
	<rmk+kernel@arm.linux.org.uk>, Ulrich Hecht <ulrich.hecht@gmail.com>,
	Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
	<linux-renesas-soc@vger.kernel.org>
From: Jose Abreu <Jose.Abreu@synopsys.com>
Message-ID: <8eb90f8b-fa99-5fd3-c20d-d090c7992d7b@synopsys.com>
Date: Thu, 5 Jan 2017 14:27:23 +0000
MIME-Version: 1.0
In-Reply-To: <3716714.KhkP0QV9QI@avalon>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,


On 05-01-2017 11:44, Laurent Pinchart wrote:

[snip]

>>> I've tried moving SVSRET right before the reset and everything still seems
>>> to work fine, so I'll submit a patch.
>>>
>>> Is the rest of the sequence correct ? When should SVSRET be deasserted
>>> (the driver currently keeps it asserted at all times) ?
>> It should not be deasserted.
> At all ? Even when powering the PHY down ?

The source code I have here does not deassert the signal, even
when powering down BUT I am checking the docs and this signal can
optionally go low after the phy goes to power down mode (i.e.
after all power down sequence is correctly done, this includes
waiting for TX_READY to go low as Russell King previously said),
though its not mandatory. I think I miss explained how this mode
works: When deasserted the phy goes to low power mode, thats why
you need to assert it in power up. We can try to add this in
power down sequence but its very important to check the status of
TX_READY before changing SVSRET.

Best regards,
Jose Miguel Abreu

[snip]
