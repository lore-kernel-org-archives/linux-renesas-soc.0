Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:34741 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751953AbdFZP4y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Jun 2017 11:56:54 -0400
Date: Mon, 26 Jun 2017 10:56:42 -0500
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 1/7] dt-bindings: display: renesas: Add R-Car M3-W
 HDMI TX DT bindings
Message-ID: <20170626155642.6ux7rdtwup6vzhnk@rob-hp-laptop>
References: <20170621093133.5677-1-laurent.pinchart+renesas@ideasonboard.com>
 <20170621093133.5677-2-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170621093133.5677-2-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jun 21, 2017 at 12:31:27PM +0300, Laurent Pinchart wrote:
> The M3-W HDMI TX controller seems to be compatible for the H3. No
> extension to the DT bindings are needed, add an SoC-specific compatible
> string in case differences between the IP versions are found later and
> require model-specific handling.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Rob Herring <robh@kernel.org>
