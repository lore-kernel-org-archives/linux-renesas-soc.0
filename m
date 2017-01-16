Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from fllnx210.ext.ti.com ([198.47.19.17]:48341 "EHLO
        fllnx210.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750892AbdAPJox (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Jan 2017 04:44:53 -0500
Subject: Re: [PATCH v2 0/2] phy: Replace the deprecated extcon API
To: Chanwoo Choi <cw00.choi@samsung.com>,
        <maxime.ripard@free-electrons.com>, <wens@csie.org>
References: <CGME20161230041136epcas5p4e0229714cd00961e5d3cb5ef9923b7aa@epcas5p4.samsung.com>
 <1483071089-8362-1-git-send-email-cw00.choi@samsung.com>
 <58749873.4070302@samsung.com> <587C8DE8.5050106@samsung.com>
CC: <linux-kernel@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <chanwoo@kernel.org>
From: Kishon Vijay Abraham I <kishon@ti.com>
Message-ID: <587C95F0.2020906@ti.com>
Date: Mon, 16 Jan 2017 15:14:16 +0530
MIME-Version: 1.0
In-Reply-To: <587C8DE8.5050106@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>



On Monday 16 January 2017 02:40 PM, Chanwoo Choi wrote:
> Hi Kishon,
> 
> On 2017년 01월 10일 17:16, Chanwoo Choi wrote:
>> Hi Kishon,
>>
>> Could you review these patches or pick up them if there is no any comment?
> 
> If there are no comments, could you apply these patches?

merged it already. You should see it phy -next before tomorrow.

Thanks
Kishon

> 
>>
>> On 2016년 12월 30일 13:11, Chanwoo Choi wrote:
>>> This patches just replace the deprecated extcon API without any change
>>> of extcon operation and use the resource-managed function for
>>> extcon_register_notifier().
>>>
>>> The new extcon API instead of deprecated API.
>>> - extcon_set_cable_state_() -> extcon_set_state_sync();
>>> - extcon_get_cable_state_() -> extcon_get_state();
>>>
>>> Changes from v1:
>>> - Rebase these patches based on v4.10-rc1.
>>> - Drop the usb/power-supply/chipidea patches.
>>>
>>> Chanwoo Choi (2):
>>>   phy: rcar-gen3-usb2: Replace the deprecated extcon API
>>>   phy: sun4i-usb: Replace the deprecated extcon API
>>>
>>>  drivers/phy/phy-rcar-gen3-usb2.c | 8 ++++----
>>>  drivers/phy/phy-sun4i-usb.c      | 4 ++--
>>>  2 files changed, 6 insertions(+), 6 deletions(-)
>>>
>>
> 
> 
