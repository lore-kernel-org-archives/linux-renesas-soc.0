Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f195.google.com ([209.85.208.195]:40696 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728918AbeGaKEC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 31 Jul 2018 06:04:02 -0400
Received: by mail-lj1-f195.google.com with SMTP id j19-v6so12913865ljc.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 31 Jul 2018 01:24:50 -0700 (PDT)
Subject: Re: [PATCH 2/3] drm: rcar-du: Rename var to a more precise name
To: Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>
Cc: "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
        "open list:DRM DRIVERS FOR RENESAS"
        <linux-renesas-soc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
References: <1532971214-17962-1-git-send-email-jacopo@jmondi.org>
 <1532971214-17962-3-git-send-email-jacopo@jmondi.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <8104d980-f433-7fe8-d0d2-9028019332d9@cogentembedded.com>
Date: Tue, 31 Jul 2018 11:24:48 +0300
MIME-Version: 1.0
In-Reply-To: <1532971214-17962-3-git-send-email-jacopo@jmondi.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 7/30/2018 8:20 PM, Jacopo Mondi wrote:

> Rename the 'value' variable, only used to for writing to DMSR register to a
                                          ^^ not needed

> more precise 'dmsr' name.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
[...]

MBR, Sergei
