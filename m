Return-Path: <SRS0=sDbg=P5=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0F19C7112F
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Jan 2019 11:49:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7FBAE20870
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Jan 2019 11:49:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kb/KZ+xj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728128AbfAULtR (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 21 Jan 2019 06:49:17 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:41235 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728034AbfAULtQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jan 2019 06:49:16 -0500
Received: by mail-pg1-f196.google.com with SMTP id m1so9385459pgq.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Jan 2019 03:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:subject;
        bh=pZ+AbjMm8chtG3JxYEIqXKIDSRHb16jmrTtnK00vTFM=;
        b=Kb/KZ+xjxSR0GzMvmDAWzPk2vmvzWSy6p5B3Ab3440fOxH9x8pqsKu/lgWh8ccFpZv
         5msOzMjsg/FW/sS6JE7jdL/kQ1HUHEAEUyeXecMZr3S2kFpUbH/juaBQ6WfOqI2UgVmB
         Q2Xeh3OtK1Ddavk1JS5WWLDnsbceKyuBfBinD0fRSy6rPwvhO8BxaSxU2UyMpvb23C53
         bVMpq1h+JwN4DszRZROMP0VD5fKN1qqTdeG8S0XW3Map8wpZw7esz0GaAiUbbKsIltWF
         l2kmCt10hwppDMOuO9dnDbym8MRXTD8j9BEKn5Uj9f5FpdW/fZNPQFsWvCmGzvgcwrWQ
         9Z0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:subject;
        bh=pZ+AbjMm8chtG3JxYEIqXKIDSRHb16jmrTtnK00vTFM=;
        b=b7w87MvPdZsOTgI6uSTLBhRxvQuO1L5enbY+uPKpbrcVT3xYMCs7hYf8NIOsTbLHY/
         RwPtH4GkDY87Bn5/qBSPQCG/AtvMFJ5zgAisNfMIfsCDyRQwHMPJF00NGakiISZcNewp
         EFm0PENgJ+V9+eBIEaMDePxLy1iq+/kKONZbVdYKLxbCzP05AyrUOPkXL11BFlWNVP//
         s7qL4iWvuUiSTwLkOemY1GkL/nI8Sm/BAnXh+1TV5qXg+NNUpLAqYElDeX0yllqmWbg4
         uRbEypHezeHV4gdNRvdNh8cp1RFl+2TMRK9GbayymKmhwN0kAGV3xb9GTlWRzzWH2Umg
         08Ng==
X-Gm-Message-State: AJcUukdXoabZNpYs3/UE6zRERjYvw9mXownjFRWO3SYhr4o4m+HAwD5u
        gifkUGWQVPHJlKIExVXz44RZPrUY
X-Google-Smtp-Source: ALg8bN64eEvrt7zg8Hql/WPEM0vKtxV4MUOOvmIrlAHn4cQufY8J9ceV3aeXmg8+k4viPeEFC29sUg==
X-Received: by 2002:a62:444b:: with SMTP id r72mr29887944pfa.184.1548071355969;
        Mon, 21 Jan 2019 03:49:15 -0800 (PST)
Received: from [127.0.0.1] (30.net042126252.t-com.ne.jp. [42.126.252.30])
        by smtp.gmail.com with ESMTPSA id n21sm18057084pfg.84.2019.01.21.03.49.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Jan 2019 03:49:14 -0800 (PST)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     horms+renesas@verge.net.au, Magnus Damm <magnus.damm@gmail.com>,
        geert+renesas@glider.be, Konstantin.Kozhevnikov@cogentembedded.com,
        sergei.shtylyov@cogentembedded.com
Date:   Mon, 21 Jan 2019 20:49:55 +0900
Message-Id: <154807139502.25511.1919986589060151108.sendpatchset@octo>
Subject: [PATCH/RFC 00/02] Remove undocumented IMR-LX4 device nodes
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Remove undocumented IMR-LX4 device nodes

[PATCH/RFC 01/02] arm64: dts: renesas: r8a7795: Remove IMR-LX4 device nodes
[PATCH/RFC 02/02] arm64: dts: renesas: r8a7796: Remove IMR-LX4 device nodes

These patches take the easy way out and simply remove the undocumented
IMR-LX4 device nodes from the upstream tree. Good or bad, let me know!

So perhaps this is a bit overly aggressive but since the DT bindings seem
undocumented and no driver exists in upstream my gut feeling says these DT
nodes were part of an upstreaming attempt that got suspended half-way through.

In case DT binding documentation is in-flight and queued up somewhere
(ideally together with a driver) then feel free to ignore this series.

Instead of removing nodes we could also document the DT bindings for the
IMR-LX4 devices. It would also make sense to add device nodes to other
more recent SoCs than just H3 and M3-W. But blindly adding more DT nodes
with a DT binding but without a driver seems a bit suboptimal compared to
testing against an actual driver.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Developed on top of v5.0-rc3

 arch/arm64/boot/dts/renesas/r8a7795.dtsi |   40 ------------------------------
 arch/arm64/boot/dts/renesas/r8a7796.dtsi |   20 ---------------
 2 files changed, 60 deletions(-)
