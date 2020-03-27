Return-Path: <SRS0=bPEI=5M=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01D51C43331
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 27 Mar 2020 05:40:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C7A23206E6
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 27 Mar 2020 05:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1585287639;
	bh=BnzFQGP21tibrUI0XEj4gDoUi/hbHaz1q9dFw0Nf1bc=;
	h=Subject:From:Date:To:List-ID:From;
	b=PXdPVOKelUUD57KSeqK5VARiOpekXcfKWL1QOtUlGZ2xSNnVMj0AxMYqiWwj3zMMH
	 I7kx/uDlUjna0dDc7SiiUU/kWs6yhq6OovF1ZOM3a2PPjg2h9VKF4FojQNK7GHQh5M
	 C5Ycwb/LuDuXl7D85Gvsb3FOMOwmOgZwllYapr/s=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725942AbgC0Fkj (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 27 Mar 2020 01:40:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:53154 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725936AbgC0Fkj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Mar 2020 01:40:39 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585287639;
        bh=BnzFQGP21tibrUI0XEj4gDoUi/hbHaz1q9dFw0Nf1bc=;
        h=Subject:From:Date:To:From;
        b=JnD0H529bJYpgqHjduyq2ni9T5oqkrKkaUyYXCis6Sd/QfaLuWiIFSV+ZcB4WBPG4
         fNtlwU6F1014VVqt0DzfmYVbO4t5014tpmnMeDgji2U+0tJyZKDo9dM7U3nP0rcNAo
         YPqSooaxlFLNWXn+qSSh4/9aB7I8w/wNtqAZx5PI=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158528763905.926.2388975023676229369.git-patchwork-housekeeping@kernel.org>
Date:   Fri, 27 Mar 2020 05:40:39 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v3] dt-bindings: phy: add r8a77961 support (2020-03-27T05:28:39)
  Superseding: [v2] dt-bindings: phy: add r8a77961 support (2020-03-26T05:29:18):
    [v2,1/4] dt-bindings: phy: renesas: usb2-phy: convert bindings to json-schema
    [v2,2/4] dt-bindings: phy: renesas: usb2-phy: add r8a77961 support
    [v2,3/4] dt-bindings: phy: renesas: usb3-phy: convert bindings to json-schema
    [v2,4/4] dt-bindings: phy: renesas: usb3-phy: add r8a77961 support


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
