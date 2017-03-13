Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f52.google.com ([209.85.215.52]:34611 "EHLO
        mail-lf0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751545AbdCML5G (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Mar 2017 07:57:06 -0400
Received: by mail-lf0-f52.google.com with SMTP id z15so40450857lfd.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Mar 2017 04:56:59 -0700 (PDT)
Subject: Re: [PATCH v2] phy: rcar-gen3-usb2: fix implementation for runtime PM
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, kishon@ti.com
References: <1489397969-26153-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <983f7c65-38f8-a04f-f809-ab6bbd8ac8f5@cogentembedded.com>
Date: Mon, 13 Mar 2017 14:56:55 +0300
MIME-Version: 1.0
In-Reply-To: <1489397969-26153-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 03/13/2017 12:39 PM, Yoshihiro Shimoda wrote:

> This patch fixes an issue that this driver doesn't take care of the runtime
> PM. This code assumed that devm_phy_create() called pm_runtime_enable(dev),
> but it misunderstood the dev_phy_create()'s specification.
> This driver should call its own pm_runtime_pm() before dev_phy_create().

    You probably meant pm_runtime_enable()? Sorry for not noticing the 1st time...

> Fixes: f3b5a8d9b50d ("phy: rcar-gen3-usb2: Add R-Car Gen3 USB2 PHY driver")
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
[...]

MBR, Sergei
