Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:33796 "EHLO
	mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751082AbcFXQMh (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 24 Jun 2016 12:12:37 -0400
Date: Fri, 24 Jun 2016 11:12:30 -0500
From: Rob Herring <robh@kernel.org>
To: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
Cc: mkl@pengutronix.de, wg@grandegger.com, pawel.moll@arm.com,
	mark.rutland@arm.com, ijc+devicetree@hellion.org.uk,
	galak@codeaurora.org, ulrich.hecht+renesas@gmail.com,
	horms@verge.net.au, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-can@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, chris.paterson2@renesas.com,
	magnus.damm@gmail.com, socketcan@hartkopp.net
Subject: Re: [PATCH v2 1/2] can: rcar_canfd: Add Classical CAN only mode
 support
Message-ID: <20160624161230.GA21437@rob-hp-laptop>
References: <1466434007-50873-1-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
 <1466598707-44076-1-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
 <1466598707-44076-2-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1466598707-44076-2-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jun 22, 2016 at 01:31:46PM +0100, Ramesh Shanmugasundaram wrote:
> The controller can operate in one of the two global modes
>  - CAN FD only mode (default)
>  - Classical CAN (CAN2.0) only mode
> 
> This patch adds support for Classical CAN only mode. It can be enabled
> by defining the optional device tree property "renesas,no-can-fd" of this
> node.
> 
> Note: R-Car Gen3 h/w manual v0.51E shows bit6 of RSCFDnCFDGCFG as
> reserved, which is incorrect. This bit is same as RSCFDnGCFG.
> 
> Signed-off-by: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
> ---
>  .../devicetree/bindings/net/can/rcar_canfd.txt     |  21 +-

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/net/can/rcar/rcar_canfd.c                  | 355 ++++++++++++++-------
>  2 files changed, 255 insertions(+), 121 deletions(-)
