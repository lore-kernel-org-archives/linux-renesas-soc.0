Return-Path: <SRS0=xiOs=4N=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 562F6C35E01
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 25 Feb 2020 18:40:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2FDD92084E
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 25 Feb 2020 18:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582656037;
	bh=42P5yBgA2wVRTwTIWcwAhB/FDNBNA43bMkDJVXOEHsQ=;
	h=Subject:From:Date:To:List-ID:From;
	b=cTEf4dgtYWG7dQSli+ZNt0IAT9jMPbCjAtrbamFlQV03vGMELNbZQzCVITBjhm06o
	 N4+PeezFXJzCJ0YHsWMT/Q7ZXdo3Kc2VFtFw6dQAZd6l68ObA9yk9MNllV1WPVrMCt
	 6JTyS9mmVpZgUiK48Seuzxqm+nk1K3snLcCR1bMM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731653AbgBYSkg (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 25 Feb 2020 13:40:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:50872 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731557AbgBYSkg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Feb 2020 13:40:36 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582656036;
        bh=42P5yBgA2wVRTwTIWcwAhB/FDNBNA43bMkDJVXOEHsQ=;
        h=Subject:From:Date:To:From;
        b=KIVcY+EjnzprC7YUf+mPbQ2cuK6AwL0Qq/8KDLFBE0RwsAhLmGFIfi+IHNyGes/Nc
         0RY/FZ/k6bjjjhvfeHyD2qGmsIcHLMrY85Q12gydmkNWh1RWhdE7y4focRNeHpgKFQ
         MXKs3c0KdbEtQllxgk05kmgJFwdQM3jCe2b4qabM=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158265603597.22359.10733766306139408432.git-patchwork-housekeeping@kernel.org>
Date:   Tue, 25 Feb 2020 18:40:35 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] usb: hub: Fix unhandled return value of usb_autopm_get_interface() (2020-02-25T18:30:57)
  Superseding: [v1] usb: hub: Fix unhandled return value of usb_autopm_get_interface() (2020-02-25T13:08:46):
    usb: hub: Fix unhandled return value of usb_autopm_get_interface()


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
