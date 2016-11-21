Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:35201 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753067AbcKUQsv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Nov 2016 11:48:51 -0500
Date: Mon, 21 Nov 2016 10:48:46 -0600
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 02/13] devicetree/bindings: display: Add bindings for
 LVDS panels
Message-ID: <20161121164846.ej24znigtiw6m6u5@rob-hp-laptop>
References: <1479526093-7014-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <1479526093-7014-3-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1479526093-7014-3-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sat, Nov 19, 2016 at 05:28:02AM +0200, Laurent Pinchart wrote:
> LVDS is a physical layer specification defined in ANSI/TIA/EIA-644-A.
> Multiple incompatible data link layers have been used over time to
> transmit image data to LVDS panels. This binding supports display panels
> compatible with the JEIDA-59-1999, Open-LDI and VESA SWPG
> specifications.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  .../bindings/display/panel/panel-lvds.txt          | 120 +++++++++++++++++++++
>  1 file changed, 120 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-lvds.txt

Acked-by: Rob Herring <robh@kernel.org>
