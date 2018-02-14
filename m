Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f52.google.com ([209.85.215.52]:34539 "EHLO
        mail-lf0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1032316AbeBNQex (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Feb 2018 11:34:53 -0500
Received: by mail-lf0-f52.google.com with SMTP id l191so1599256lfe.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Feb 2018 08:34:52 -0800 (PST)
Subject: Re: [PATCH] drm: rcar-du: lvds: Fix LVDS clock frequency range
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
References: <20180112214010.7139-1-laurent.pinchart+renesas@ideasonboard.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <7485ea0b-5cdc-aad8-117d-f2c4b9e3f9a6@cogentembedded.com>
Date: Wed, 14 Feb 2018 19:34:49 +0300
MIME-Version: 1.0
In-Reply-To: <20180112214010.7139-1-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 01/13/2018 12:40 AM, Laurent Pinchart wrote:

> According to the latest versions of both the Gen2 and Gen3 datasheets,
> the operating range for the LVDS clock is 31 MHz to 148.5 MHz on all

   Not quite so with R-Car D3/E3 (which have the low boundary of 5 MHz) But we don't
support them yet anyway...

> SoCs. Update the driver accordingly.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
[...]

Acked-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

MBR, Sergei
