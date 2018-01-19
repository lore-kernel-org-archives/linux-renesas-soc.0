Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ot0-f194.google.com ([74.125.82.194]:38058 "EHLO
        mail-ot0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752938AbeASVYs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Jan 2018 16:24:48 -0500
Date: Fri, 19 Jan 2018 15:24:46 -0600
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 02/10] dt-bindings: display: renesas: Deprecate LVDS
 support in the DU bindings
Message-ID: <20180119212446.ze4m6sjmh6vfqgah@rob-hp-laptop>
References: <20180112005858.26472-1-laurent.pinchart+renesas@ideasonboard.com>
 <20180112005858.26472-3-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180112005858.26472-3-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Jan 12, 2018 at 02:58:50AM +0200, Laurent Pinchart wrote:
> The internal LVDS encoders now have their own DT bindings, representing
> them as part of the DU is deprecated.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  .../devicetree/bindings/display/renesas,du.txt     | 26 +++++++++-------------
>  1 file changed, 11 insertions(+), 15 deletions(-)

This is the easy part. :)

Reviewed-by: Rob Herring <robh@kernel.org>
