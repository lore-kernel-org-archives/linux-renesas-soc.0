Return-Path: <devicetree-owner@vger.kernel.org>
Subject: Re: [PATCH v5 8/9] media: i2c: tw9910: Remove soc_camera dependencies
To: Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart@ideasonboard.com, magnus.damm@gmail.com,
        geert@glider.be, mchehab@kernel.org, festevam@gmail.com,
        sakari.ailus@iki.fi, robh+dt@kernel.org, mark.rutland@arm.com,
        pombredanne@nexb.com
Cc: linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        linux-sh@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1515765849-10345-1-git-send-email-jacopo+renesas@jmondi.org>
 <1515765849-10345-9-git-send-email-jacopo+renesas@jmondi.org>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <3f68d8a1-b7e7-54bd-6906-37dfe7da450c@xs4all.nl>
Date: Tue, 16 Jan 2018 11:11:22 +0100
MIME-Version: 1.0
In-Reply-To: <1515765849-10345-9-git-send-email-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 01/12/2018 03:04 PM, Jacopo Mondi wrote:
> Remove soc_camera framework dependencies from tw9910 sensor driver.
> - Handle clock and gpios
> - Register async subdevice
> - Remove soc_camera specific g/s_mbus_config operations
> - Add kernel doc to driver interface header file
> - Adjust build system
> 
> This commit does not remove the original soc_camera based driver as long
> as other platforms depends on soc_camera-based CEU driver.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Acked-by: Hans Verkuil <hans.verkuil@cisco.com>

Regards,

        Hans
