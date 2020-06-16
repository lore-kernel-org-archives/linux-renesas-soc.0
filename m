Return-Path: <SRS0=vXxs=75=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70A28C433E0
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 16 Jun 2020 14:20:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 563DF20786
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 16 Jun 2020 14:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592317240;
	bh=s4TUl0nLYF0VoX5QEiTbb5nn76AFoAtT0p/ptlvFZv8=;
	h=Subject:From:Date:To:List-ID:From;
	b=0++R22hxoZLiGvBtayMLvLjDAh5k2y0cVEXHun27KOSzhODNpuKOd828swhrIvBoH
	 8CI7iWOfkXNZ5SRZyrOb8JDixDzWcrVbKYOlyiaBINfq/x6+njyMIHFdv0KpYGIdi1
	 3C7Sfv/l4tW7Nj24D+0RmogEgu9obZuKpU11qCOE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726692AbgFPOUk (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 16 Jun 2020 10:20:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:50826 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726526AbgFPOUk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Jun 2020 10:20:40 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592317239;
        bh=s4TUl0nLYF0VoX5QEiTbb5nn76AFoAtT0p/ptlvFZv8=;
        h=Subject:From:Date:To:From;
        b=GT2R5m+nL/vj7pdPpacL+vfTI8joGixk55nqoLOAzlAVXpQ0JruyPa0hQkTFKtZJX
         HMMDmASMw3LPjs8wWMYx1Q3LPEhEqt8yQMhOsaG5cPpU+zmynuHpiQWgYQOohj0eKi
         qDmg22qX7tXCj4oYl0E1EwwvSObTNn2g/nzA9Jto=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159231723968.30726.1143815980353210274.git-patchwork-housekeeping@kernel.org>
Date:   Tue, 16 Jun 2020 14:20:39 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v5] v4l2-subdev: Introduce [g|s]et_mbus_format pad op (2020-06-16T14:12:35)
  Superseding: [v4] v4l2-subdev: Introduce [g|s]et_mbus_format pad op (2020-06-11T16:16:42):
    [v4,1/9] media: v4l2-subdv: Introduce [get|set]_mbus_config pad ops
    [v4,2/9] media: i2c: Use the new get_mbus_config pad op
    [v4,3/9] media: i2c: ov6650: Use new [get|set]_mbus_config ops
    [v4,4/9] media: pxa_camera: Use the new set_mbus_config op
    [v4,5/9] media: v4l2-subdev: Remove [s|g]_mbus_config video ops
    [v4,6/9] staging: media: imx: Update TODO entry
    [v4,7/9] media: i2c: adv748x: Adjust TXA data lanes number
    [v4,8/9] media: i2c: adv748x: Implement get_mbus_config
    [v4,9/9] media: rcar-csi2: Negotiate data lanes number


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
