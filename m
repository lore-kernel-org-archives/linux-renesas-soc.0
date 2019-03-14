Return-Path: <SRS0=FDtJ=RR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10274C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 14 Mar 2019 08:08:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BB47221019
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 14 Mar 2019 08:08:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=umn.edu header.i=@umn.edu header.b="db/phBQP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726638AbfCNIIB (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 14 Mar 2019 04:08:01 -0400
Received: from mta-p8.oit.umn.edu ([134.84.196.208]:39018 "EHLO
        mta-p8.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726627AbfCNIH5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Mar 2019 04:07:57 -0400
Received: from localhost (unknown [127.0.0.1])
        by mta-p8.oit.umn.edu (Postfix) with ESMTP id 0C573C65
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Mar 2019 08:07:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p8.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p8.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id oBJMtBWF0uZn for <linux-renesas-soc@vger.kernel.org>;
        Thu, 14 Mar 2019 03:07:55 -0500 (CDT)
Received: from mail-it1-f199.google.com (mail-it1-f199.google.com [209.85.166.199])
        (using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p8.oit.umn.edu (Postfix) with ESMTPS id CBACEB89
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Mar 2019 03:07:55 -0500 (CDT)
Received: by mail-it1-f199.google.com with SMTP id j127so3982777itj.7
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Mar 2019 01:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Kb2MUkZrbDxyWVobIVoD47XbUyDSTUuGSgsDc9X7Vv0=;
        b=db/phBQPaF9vHVY26K/yZUaF1vg/gHllaz8t716IUQj36Sxc+X52bmEjptTugm+chI
         hrmZRKH0LxwSwLRLVIX6nGypGLsSDLU64cpHyOGjEzGhn3EqL1VrC2eyzYQyo7dRcFBl
         rXFKN+TUgHq+MWHbL7eccoEHWrnz1n7nXp2vU8B1hT7m5TwhIJalg/NA2q4B3s4YUGZL
         KeLbajJiuBn4OAvD0LENW6GpC3ip124g5bkNCpqLNljJM+kZejCJixwRfe8Y+EFxM44q
         A7ywwIOHzbEEp3aVz1AGglJYAZqxUWW8tIVLEYoXHg+63Ec1MjAeqN5zloxWsqQQDays
         VEHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Kb2MUkZrbDxyWVobIVoD47XbUyDSTUuGSgsDc9X7Vv0=;
        b=pF8G1MAQRM+kEJBtT2g453qi8/kFOwFDQpBkUfw/Fh4bhY1leQvStmRGnisHGw2tFr
         sOyOuWY7vTG1wcxTjADZMAKevPZg07d6qFqebmTgkArNDhGQCmzvY4TKj1ASlFhDDCnp
         wdY5cl/Y9+she4yQqcQ6i4t3sUG8TELviPMINYGpZSD0PIu2c969HtSO9r5Zm9UP+lbS
         1KYYtfvusi3jthgQDCIx5QG+fVIEoW7UqApwaz4XLVQ557VRHnZfhS8IDbyC7YjmaseX
         6MqVbpQqQUV5waB5Vf0kYk4QEjZSXcCeexB1nMaxlCb1FFva4PZpfb4h24coUTRtMW5D
         3f3Q==
X-Gm-Message-State: APjAAAVE4DMA2c20h9wqZUy/OvvcCyXKccbL+kOIxKix33Vd67hV1h9A
        rEzjmUG1ov8dekZUfMAxfDVk566COOelamsdo5V900EmuBguvjTZiEHlSCQkeH2MUuRg+pYHPuq
        Kc1yTcp1NnNeYVmtVUVga/YP30noxDvTyfXA=
X-Received: by 2002:a24:1947:: with SMTP id b68mr1108975itb.121.1552550875413;
        Thu, 14 Mar 2019 01:07:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwIZzecVW+eNuyJqTFO+OusWO33nkN4TIgsXOao6i2Mq7RWpnDyAtq3PO+IFT+hCM7ipOMi/w==
X-Received: by 2002:a24:1947:: with SMTP id b68mr1108966itb.121.1552550875171;
        Thu, 14 Mar 2019 01:07:55 -0700 (PDT)
Received: from bee.dtc.umn.edu (cs-bee-u.cs.umn.edu. [128.101.106.63])
        by smtp.gmail.com with ESMTPSA id b202sm786154itb.36.2019.03.14.01.07.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 Mar 2019 01:07:54 -0700 (PDT)
From:   Kangjie Lu <kjlu@umn.edu>
To:     kjlu@umn.edu
Cc:     pakki001@umn.edu, Simon Horman <horms@verge.net.au>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] pci: pcie-rcar: fix a potential NULL pointer dereference
Date:   Thu, 14 Mar 2019 03:07:41 -0500
Message-Id: <20190314080741.31983-1-kjlu@umn.edu>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAMuHMdVJENz5wnOV=TX5cVdTsOZD25SwprSLpetZpAsMcPtvEA@mail.gmail.com>
References: <CAMuHMdVJENz5wnOV=TX5cVdTsOZD25SwprSLpetZpAsMcPtvEA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

In case __get_free_pages fails and returns NULL, the fix returns
-ENOMEM and releases resources to avoid NULL pointer dereference.

Signed-off-by: Kangjie Lu <kjlu@umn.edu>

---
V2 removes the error message.
---
 drivers/pci/controller/pcie-rcar.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pci/controller/pcie-rcar.c b/drivers/pci/controller/pcie-rcar.c
index c8febb009454..71e55995c058 100644
--- a/drivers/pci/controller/pcie-rcar.c
+++ b/drivers/pci/controller/pcie-rcar.c
@@ -929,6 +929,10 @@ static int rcar_pcie_enable_msi(struct rcar_pcie *pcie)
 
 	/* setup MSI data target */
 	msi->pages = __get_free_pages(GFP_KERNEL, 0);
+	if (!msi->pages) {
+		err = -ENOMEM;
+		goto err;
+	}
 	base = virt_to_phys((void *)msi->pages);
 
 	rcar_pci_write_reg(pcie, base | MSIFE, PCIEMSIALR);
-- 
2.17.1

