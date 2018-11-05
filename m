Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-yw1-f65.google.com ([209.85.161.65]:42961 "EHLO
        mail-yw1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726027AbeKFF7B (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Nov 2018 00:59:01 -0500
From: Florian Fainelli <f.fainelli@gmail.com>
To: bcm-kernel-feedback-list@broadcom.com,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Brian Norris <computersforpeace@gmail.com>,
        Gregory Fong <gregory.0xf0@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/1] bus: brcmstb_gisb: simplify getting .driver_data
Date: Mon,  5 Nov 2018 12:37:23 -0800
Message-Id: <20181105203723.7031-1-f.fainelli@gmail.com>
In-Reply-To: <20181021195958.1412-2-wsa+renesas@sang-engineering.com>
References: <20181021195958.1412-1-wsa+renesas@sang-engineering.com> <20181021195958.1412-2-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sun, 21 Oct 2018 21:59:58 +0200, Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:
> We should get 'driver_data' from 'struct device' directly. Going via
> platform_device is an unneeded step back and forth.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---

Applied to drivers/next, thanks!
--
Florian
