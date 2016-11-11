Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:40743 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751308AbcKKRsj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Nov 2016 12:48:39 -0500
Subject: Re: [PATCH 01/10] drm: bridge/dw_hdmi: add dw hdmi i2c bus adapter
 support
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        <linux-renesas-soc@vger.kernel.org>,
        <laurent.pinchart@ideasonboard.com>,
        <dri-devel@lists.freedesktop.org>
References: <1478884066-1090-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <1478884066-1090-2-git-send-email-ulrich.hecht+renesas@gmail.com>
CC: <kuninori.morimoto.gx@renesas.com>, <geert@linux-m68k.org>,
        <airlied@linux.ie>, <koji.matsuoka.xm@renesas.com>
From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Message-ID: <e8c30b91-2ed5-2c53-89d1-de6b46812036@mentor.com>
Date: Fri, 11 Nov 2016 19:48:31 +0200
MIME-Version: 1.0
In-Reply-To: <1478884066-1090-2-git-send-email-ulrich.hecht+renesas@gmail.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Ulrich,

On 11/11/2016 07:07 PM, Ulrich Hecht wrote:
> From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
>
> The change adds support of internal HDMI I2C master controller, this
> subdevice is used by default, if "ddc-i2c-bus" DT property is omitted.
>
> The main purpose of this functionality is to support reading EDID from
> an HDMI monitor on boards, which don't have an I2C bus connected to
> DDC pins.
>
> The current implementation does not support "I2C Master Interface
> Extended Read Mode" to read data addressed by non-zero segment
> pointer, this means that if EDID has more than 1 extension blocks,
> EDID reading operation won't succeed, in my practice all tested HDMI
> monitors have at maximum one extension block.
>
> Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
> Acked-by: Rob Herring <robh@kernel.org>

many thanks to Philipp for pushing the change, as for today, it is in drm-next:

   https://cgit.freedesktop.org/~airlied/linux/commit/?h=drm-next&id=90233ee5d1

--
With best wishes,
Vladimir
