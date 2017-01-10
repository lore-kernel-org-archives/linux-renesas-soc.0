Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-version: 1.0
Content-type: text/plain; charset=UTF-8
Content-transfer-encoding: 8BIT
Message-id: <58749873.4070302@samsung.com>
Date: Tue, 10 Jan 2017 17:16:51 +0900
From: Chanwoo Choi <cw00.choi@samsung.com>
To: kishon@ti.com, maxime.ripard@free-electrons.com, wens@csie.org
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, chanwoo@kernel.org
Subject: Re: [PATCH v2 0/2] phy: Replace the deprecated extcon API
In-reply-to: <1483071089-8362-1-git-send-email-cw00.choi@samsung.com>
References: <CGME20161230041136epcas5p4e0229714cd00961e5d3cb5ef9923b7aa@epcas5p4.samsung.com>
 <1483071089-8362-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kishon,

Could you review these patches or pick up them if there is no any comment?

On 2016년 12월 30일 13:11, Chanwoo Choi wrote:
> This patches just replace the deprecated extcon API without any change
> of extcon operation and use the resource-managed function for
> extcon_register_notifier().
> 
> The new extcon API instead of deprecated API.
> - extcon_set_cable_state_() -> extcon_set_state_sync();
> - extcon_get_cable_state_() -> extcon_get_state();
> 
> Changes from v1:
> - Rebase these patches based on v4.10-rc1.
> - Drop the usb/power-supply/chipidea patches.
> 
> Chanwoo Choi (2):
>   phy: rcar-gen3-usb2: Replace the deprecated extcon API
>   phy: sun4i-usb: Replace the deprecated extcon API
> 
>  drivers/phy/phy-rcar-gen3-usb2.c | 8 ++++----
>  drivers/phy/phy-sun4i-usb.c      | 4 ++--
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 

-- 
Best Regards,
Chanwoo Choi
S/W Center, Samsung Electronics
