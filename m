Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:52398 "EHLO
	relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161249AbcE3R0Z (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 30 May 2016 13:26:25 -0400
Subject: Re: [RFC 04/21] drm: bridge/dw_hdmi: add dw hdmi i2c bus adapter
 support
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
	<linux-renesas-soc@vger.kernel.org>, <geert@linux-m68k.org>
References: <1464624020-27709-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <1464624020-27709-5-git-send-email-ulrich.hecht+renesas@gmail.com>
CC: <kuninori.morimoto.gx@renesas.com>,
	<laurent.pinchart@ideasonboard.com>,
	<dri-devel@lists.freedesktop.org>, <architt@codeaurora.org>,
	<vz@mleia.com>, <koji.matsuoka.xm@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Message-ID: <574C77BB.1070302@mentor.com>
Date: Mon, 30 May 2016 20:26:19 +0300
MIME-Version: 1.0
In-Reply-To: <1464624020-27709-5-git-send-email-ulrich.hecht+renesas@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Ulrich,

On 30.05.2016 19:00, Ulrich Hecht wrote:
> From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
> 
> The change adds support of internal HDMI I2C master controller, this
> subdevice is used by default, if "ddc-i2c-bus" DT property is omitted.
> 
> The main purpose of this functionality is to support reading EDID from
> an HDMI monitor on boards, which don't have an I2C bus connected to
> DDC pins.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
> Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

thank you for pushing it, this is v3 of the change, right?

I think it might be better to consider to take the latest v5, it has
updated documentation notes, various improvements based on review from
Russell King, Doug Anderson and Philipp Zabel:

  http://www.spinics.net/lists/arm-kernel/msg447954.html

Still you may find it a bit outdated and it may require rebase, the change
was based on v4.3.0-rc3. Please let me know, if I can provide you support
of any kind regarding the change.

--
With best wishes,
Vladimir
