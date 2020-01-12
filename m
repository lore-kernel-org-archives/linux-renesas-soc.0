Return-Path: <SRS0=IN1S=3B=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E0FCC33CA9
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 12 Jan 2020 23:40:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6073121556
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 12 Jan 2020 23:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578872434;
	bh=KO5nwB9Dw3sggUDaB3/r9nKXISTFO3wtZUKsCZMtjEA=;
	h=Subject:From:Date:To:List-ID:From;
	b=e6z49qV56yES4ZCI//mu/HVAJ/q3zUYWLWN9dhO0bMGlGeklCsqAoC0CnIdw9h490
	 OgK93cOHkDc/FFrUdnuu2yZwMlMzc+y2VEgIxG4droe5TsixUK9El+MsZlIAFhkpzU
	 MVEFhUEXtw6bbX9GxxFuf6rHRMD52PPlVjSj5Kgg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387422AbgALXke (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 12 Jan 2020 18:40:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:58842 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727323AbgALXke (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 12 Jan 2020 18:40:34 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578872433;
        bh=KO5nwB9Dw3sggUDaB3/r9nKXISTFO3wtZUKsCZMtjEA=;
        h=Subject:From:Date:To:From;
        b=Shca9ysvtm9eAbqwSAp0eH0zWHTpa6+BIjFKual6eaPrWNfke58XXMa7fR+h9vbkH
         eQvR+/dEV8zfMLpcOEIJug1JXB+PuM/8MKkyYgJdQOTCsUU95jugelLPD3CLcayuKk
         dhDwRArG93ERaS1jiL5ilMFP0sPIT61nOrOm3GBU=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157887243349.29211.14435501735286170128.git-patchwork-housekeeping@kernel.org>
Date:   Sun, 12 Jan 2020 23:40:33 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v3] v4l2-dev/ioctl: Add V4L2_CAP_IO_MC (2020-01-12T23:24:53)
  Superseding: [v2] v4l2-dev/ioctl: Add V4L2_CAP_IO_MC (2019-11-15T23:55:54):
    [v2,1/6] v4l2-dev/ioctl: Add default handlers for VIDIOC_{G,S}_{INPUT,OUTPUT}
    [v2,2/6] rcar-vin: Use default VIDIOC_{G,S}_{INPUT,OUTPUT} handler
    [v2,3/6] staging/intel-ipu3: Use default VIDIOC_{G,S}_{INPUT,OUTPUT} handler
    [v2,4/6] v4l2-dev/ioctl: Add V4L2_CAP_IO_MC
    [v2,5/6] rcar-vin: Make use of V4L2_CAP_IO_MC
    [v2,6/6] staging/intel-ipu3: Make use of V4L2_CAP_IO_MC


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
