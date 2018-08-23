Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f196.google.com ([209.85.208.196]:40937 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726207AbeHWUYN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Aug 2018 16:24:13 -0400
Received: by mail-lj1-f196.google.com with SMTP id j19-v6so4693961ljc.7
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Aug 2018 09:53:36 -0700 (PDT)
Subject: Re: [PATCH 0/2] Add R-Car V3H (R8A77980) support to the R-Car LVDS
 driver
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>
References: <ef3c6b7e-98f2-7012-71c5-6693e6e48999@cogentembedded.com>
Message-ID: <a5aae3ff-2585-8eb6-82ef-dc3677eb5abb@cogentembedded.com>
Date: Thu, 23 Aug 2018 19:53:33 +0300
MIME-Version: 1.0
In-Reply-To: <ef3c6b7e-98f2-7012-71c5-6693e6e48999@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 06/05/2018 11:25 PM, Sergei Shtylyov wrote:

> Here's the set of 2 patches against the 'drm-next' branch of the 'drm.git' repo.
> The purpose of these patches is to add the R-Car V3H (R8A77980) support to the
> R-Car LVDS driver.
> 
> [1/2] dt-bindings: display: renesas: lvds: document R8A77980 bindings
> [2/2] drm: rcar-du: lvds: add R8A77980 support

   Laurent, I'm not seeing these patches merged... they are 2.5 months old without
a comment! :-(

MBR, Sergei
