Return-Path: <SRS0=/HLL=2H=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29727C43603
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 17 Dec 2019 14:00:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E7C8620716
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 17 Dec 2019 14:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576591238;
	bh=BaXRc8g+lRbu6Tkj1ltchwssaABtiQSzVvOpZ8zpMlg=;
	h=Subject:From:Date:To:List-ID:From;
	b=FMks4J38DjMlbCbjFOslsY7wSkkOROehmxhu+x+NLnSAel09wzRwxiwnTG2H2gNwG
	 ALX1kurQ9GFRim8OZSLufPzV2obnjxBKWyD//Oh5Yhcx9/mz6WfMUcBJlPPAp5k8Vd
	 /M0Eqrk354i44XTTGbesj7p4ioup92tF9cAhdHJA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728575AbfLQOAh (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 17 Dec 2019 09:00:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:49156 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728573AbfLQOAh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Dec 2019 09:00:37 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576591237;
        bh=BaXRc8g+lRbu6Tkj1ltchwssaABtiQSzVvOpZ8zpMlg=;
        h=Subject:From:Date:To:From;
        b=nptsgh+hrt2iCXd8PQDPaaZQ7VGdfbC1jHXo36d6Uzy37bcoYKdcoBhf0FQHMsnPf
         gofsDEUE5/oP4SW8HRq5XjNSbEbbQxgMy5LtX2OuZXKBkK/zBoMZUN6Ow1Z4PrYt7Q
         2ACbqHeNhW37rNkDMRRsKJMSVCxoojG6ql5C/2zk=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157659123704.27949.4927700149612923716.git-patchwork-housekeeping@kernel.org>
Date:   Tue, 17 Dec 2019 14:00:37 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v6] Add dual-LVDS panel support to EK874 (2019-12-17T13:45:55)
  Superseding: [v5] Add dual-LVDS panel support to EK874 (2019-12-16T20:12:28):
    [v5,1/6] drm: of: Add drm_of_lvds_get_dual_link_pixel_order
    [v5,2/6] drm: rcar-du: lvds: Improve identification of panels
    [v5,3/6] drm: rcar-du: lvds: Get dual link configuration from DT
    [v5,4/6] drm: rcar-du: lvds: Allow for even and odd pixels swap
    [v5,5/6] dt-bindings: display: Add idk-2121wr binding
    [v5,6/6] arm64: dts: renesas: Add EK874 board with idk-2121wr display support


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
