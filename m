Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f175.google.com ([209.85.192.175]:43292 "EHLO
        mail-pf0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750826AbeBVUXW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Feb 2018 15:23:22 -0500
Subject: Re: [PATCH v6 0/4] R-Car DU: Convert LVDS code to bridge driver
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>,
        devicetree@vger.kernel.org
References: <20180222131336.7712-1-laurent.pinchart+renesas@ideasonboard.com>
From: Frank Rowand <frowand.list@gmail.com>
Message-ID: <1ffb9d8c-fde3-af3b-c9a7-caac5ec253eb@gmail.com>
Date: Thu, 22 Feb 2018 12:23:20 -0800
MIME-Version: 1.0
In-Reply-To: <20180222131336.7712-1-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 02/22/18 05:13, Laurent Pinchart wrote:
> Hello,
> 
> This patch series addresses a design mistake that dates back from the initial
> DU support. Support for the LVDS encoders, which are IP cores separate from
> the DU, was bundled in the DU driver. Worse, both the DU and LVDS were
> described through a single DT node.
> 
> To fix the, patches 1/4 and 2/4 define new DT bindings for the LVDS
> encoders, and deprecate their description inside the DU bindings. To retain
> backward compatibility with existing DT, patch 3/4 then patch the device tree
> at runtime to convert the legacy bindings to the new ones.
> 
> With the DT side addressed, patch 4/4 converts the LVDS support code to a
> separate bridge driver.
> 
> I decided to go for live DT patching in patch 3/4 because implementing
> support for both the legacy and new bindings in the driver would have been
> very intrusive, and prevented further cleanups. This version relies more
> heavily on overlays to avoid touching the internals of the OF core compared to
> v2, even if manual fixes to the device tree are still needed.
> 
> As all the patches but the last one have been acked, I plan to send a pull
> request by the end of the week if no new issue is discovered.
> 
> Compared to v5, I've dropped the OF changeset halpers series as Frank raised
> concerns about hidding it in the middle of a driver patch series. I've thus
> copied the implementation of of_changeset_add_property_copy() in the driver to
> avoid blocking this series. The function arguments are identical, so when the
> OF changeset helpers will land it will be very easy to drop the private copy
> and use the of_changeset_add_property_copy() helper.

Thank you Laurent.

My issues with that are procedural, and I'll reply later about this in the
v4 patch thread, where I raised the issue.  (For the peanut gallery, I
replied in thread v4 _after_ Laurent sent v5, so Laurent did not ignore
me in v5.)

My technical comments are more relevent than my process comments, in terms
of helping Laurent get his driver submitted, so I will delay the process
comments.

My technical comments will be in reply to patch 3/4.

-Frank
