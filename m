Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f43.google.com ([74.125.83.43]:44012 "EHLO
        mail-pg0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1163203AbeCBCGi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Mar 2018 21:06:38 -0500
Subject: Re: [PATCH v7 3/4 - variant 1] drm: rcar-du: Fix legacy DT to create
 LVDS encoder nodes
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
References: <20180301220540.11959-1-laurent.pinchart+renesas@ideasonboard.com>
 <20180301220540.11959-4-laurent.pinchart+renesas@ideasonboard.com>
From: Frank Rowand <frowand.list@gmail.com>
Message-ID: <b04c2436-7e4c-847c-3288-93fb768bbff6@gmail.com>
Date: Thu, 1 Mar 2018 18:06:36 -0800
MIME-Version: 1.0
In-Reply-To: <20180301220540.11959-4-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 03/01/18 14:05, Laurent Pinchart wrote:
> The internal LVDS encoders now have their own DT bindings. Before
> switching the driver infrastructure to those new bindings, implement
> backward-compatibility through live DT patching.
> 
> Patching is disabled and will be enabled along with support for the new
> DT bindings in the DU driver.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---

Reviewed-by: Frank Rowand <frank.rowand@sony.com>
