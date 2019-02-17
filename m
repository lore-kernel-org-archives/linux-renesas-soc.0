Return-Path: <SRS0=hAs+=QY=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3486AC43381
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 17 Feb 2019 12:01:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 018C92195D
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 17 Feb 2019 12:01:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IxU9r92+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725810AbfBQMBr (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 17 Feb 2019 07:01:47 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:49862 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725795AbfBQMBr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 17 Feb 2019 07:01:47 -0500
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6072949;
        Sun, 17 Feb 2019 13:01:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1550404905;
        bh=pWwEkGV4tAbm9FfzmvOclNNP6ND8QPKM2hcuBoOpIbE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IxU9r92+9VnzmllG+bBy8v0PB7MKv7ivw/PqfiVHFh9YO3wqBfLNjcfS0kdNyQiPH
         C+9vsu3VX1n18Bq89BthFVUtpcK8PW2Twi+qckxOPn4/v7PE0kjqp3Ur0Cd8RsKf2k
         X4xjuaQWtBHsqXcI/diBf0q10U7/F3Wu2LTT/qrY=
Date:   Sun, 17 Feb 2019 14:01:42 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [VSP-Tests PATCH 7/7] vsp-lib: Reset controls to defaults on
 each test run
Message-ID: <20190217120142.GC3514@pendragon.ideasonboard.com>
References: <20181204155146.9726-1-kieran.bingham@ideasonboard.com>
 <20181204155146.9726-8-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20181204155146.9726-8-kieran.bingham@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

Thank you for the patch.

On Tue, Dec 04, 2018 at 03:51:46PM +0000, Kieran Bingham wrote:
> Some of our tests set flipping and rotation controls, and the VSP cell

cell ?

> can be used again by later tests. If these controls are not reset, then
> that operation is applied to later tests incorrectly causing that test

s/that test/those tests/ ?

> to fail.
> 
> In an ideal world, tests should clean up after themselves, and leave the
> system in a known state. However the world is not ideal and we would not
> be able to guarantee any previous system state before a test was run
> anyway. Therefore it is more effective to reset state at the beginning
> of a test.
> 
> To repair this - reset all control values to their defaults at the start
> of every test during test_init()
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  scripts/vsp-lib.sh | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/scripts/vsp-lib.sh b/scripts/vsp-lib.sh
> index 3d2792707d24..33442816f208 100755
> --- a/scripts/vsp-lib.sh
> +++ b/scripts/vsp-lib.sh
> @@ -94,6 +94,14 @@ vsp1_set_control() {
>  	$yavta --no-query -w "$control $value" $subdev | ./logger.sh "$entity" >> $logfile
>  }
>  
> +vsp1_reset_controls() {
> +	local entity=$1
> +	local subdev=$(vsp1_entity_subdev $entity)
> +
> +	echo "Resetting controls on $subdev" | ./logger.sh "$entity" >> $logfile
> +	$yavta --no-query --reset-controls $subdev | ./logger.sh "$entity" >> $logfile
> +}
> +
>  # -----------------------------------------------------------------------------
>  # Reference frame generation
>  #
> @@ -1082,6 +1090,9 @@ test_init() {
>  	dev=$(vsp1_device $mdev)
>  	echo "Using device $mdev ($dev)" | ./logger.sh config >> $logfile
>  
> +	# Reset any rotation or flipping controls
> +	vsp1_reset_controls wpf.0
> +
>  	vsp_runner=./vsp-runner.sh
>  }
>  

-- 
Regards,

Laurent Pinchart
