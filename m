Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f67.google.com ([209.85.218.67]:36405 "EHLO
        mail-oi0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933756AbcJZVcQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Oct 2016 17:32:16 -0400
Date: Wed, 26 Oct 2016 16:32:14 -0500
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/8] drm: bridge: Add LVDS encoder driver
Message-ID: <20161026213214.46ev2pa6zacjajyh@rob-hp-laptop>
References: <1476887143-24831-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <1476887143-24831-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1476887143-24831-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Oct 19, 2016 at 05:25:36PM +0300, Laurent Pinchart wrote:
> The LVDS encoder driver is a DRM bridge driver that supports the
> parallel to LVDS encoders that don't require any configuration. The
> driver thus doesn't interact with the device, but creates an LVDS
> connector for the panel and exposes its size and timing based on
> information retrieved from DT.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  .../bindings/display/bridge/lvds-transmitter.txt   |  64 +++++++

It's preferred that bindings are separate patches. That makes the 
filtered DT only repo commits more sane.

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/gpu/drm/bridge/Kconfig                     |   8 +
>  drivers/gpu/drm/bridge/Makefile                    |   1 +
>  drivers/gpu/drm/bridge/lvds-encoder.c              | 203 +++++++++++++++++++++
>  4 files changed, 276 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
>  create mode 100644 drivers/gpu/drm/bridge/lvds-encoder.c
