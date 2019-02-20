Return-Path: <SRS0=Daww=Q3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 606CFC43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Feb 2019 14:56:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 270E42147C
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Feb 2019 14:56:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TrZTfb1v"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726805AbfBTO4C (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 20 Feb 2019 09:56:02 -0500
Received: from mail-pl1-f171.google.com ([209.85.214.171]:36228 "EHLO
        mail-pl1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726531AbfBTO4C (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Feb 2019 09:56:02 -0500
Received: by mail-pl1-f171.google.com with SMTP id k2so2999231plt.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Feb 2019 06:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:in-reply-to:references:subject;
        bh=QVicjaEU2qXhEmrqbs1VkegdegszyUOV2g1a+RGxwYA=;
        b=TrZTfb1vrOys/NlF41/sIKzMffcnfuzBbJV3l1xjKeconxXc7zBXM11688Ee+LmjCU
         ja/JZf2cQwEyfXd7H1sXgTNTZP6fSde7kvCu0Wf0ijLzvnrOuckJA6RJwiNBDRNzZyVD
         T4HcEDs4KofveYxftCvzfcOeQ576YtGQWLfri79yJpOFBJ8d2f0MzaxnH/bMkuC+pjES
         w+OYBYb4P/iLJgqYMSm2uWUdMdrN9pah/jscpkCkN68XY24VJKW0rLZe4MRUeh3n3bqg
         /rfpeV22/aFFyDLZ/0wywQuxgtZDzZlZxmICHpfDkDiQKaY1th7uznzDh0F8R961Y6Wz
         9FaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
         :references:subject;
        bh=QVicjaEU2qXhEmrqbs1VkegdegszyUOV2g1a+RGxwYA=;
        b=lJCAN8zhBe5M3Rtp2NL9cwvHDQdbH4UwXJGB4ipA+PH3pAbr6Fk8YsxQP6qI0osLts
         zVCo3byeVXlQDQ1Aj9eLPFAacZkjRAjORv4JeZvf+dD2xj+Vyd6O6mejXjXyL/+aTh+h
         qo1Z49DNq3vTkdaiVnG2mTnxEp+/BEmR6ekvoFSzuARuJ2CRiircfrrMEtL1Z6cIlSyT
         TLyOAYRSve9an23zYOM2J491pVo+zEcD6nRKYlvnCxmqfwmrFtY5IOik61W/5wna/CB9
         Jc3uIOPAoheO9mcZRTj4TcaQZJqu29y9TzsAUhvBUxyQCfqs1oroJvODWA0gDxMdAC2+
         fVfw==
X-Gm-Message-State: AHQUAuZHBqbnSoQs6Kww3EPBqHoccloD2aU4qUipYqVcS/b35/7+3MZI
        JAog31EhYr1fU1Zpn/amTwb0R9P0
X-Google-Smtp-Source: AHgI3IYF/ZHtx2Ax+1SvP/UapiSy0XrQdBXiLDe+z4zeuoe90Z6Q3Y/ke58Pe/1a/6MQnxMxzvJZoA==
X-Received: by 2002:a17:902:32b:: with SMTP id 40mr35761015pld.327.1550674561765;
        Wed, 20 Feb 2019 06:56:01 -0800 (PST)
Received: from [127.0.0.1] (s214090.ppp.asahi-net.or.jp. [220.157.214.90])
        by smtp.gmail.com with ESMTPSA id u18sm26765926pfa.176.2019.02.20.06.55.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 Feb 2019 06:56:00 -0800 (PST)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <magnus.damm@gmail.com>
Date:   Wed, 20 Feb 2019 23:56:53 +0900
Message-Id: <155067461331.15971.7120665878210813984.sendpatchset@octo>
In-Reply-To: <155067454871.15971.12157033067057246708.sendpatchset@octo>
References: <155067454871.15971.12157033067057246708.sendpatchset@octo>
Subject: [PATCH/RFC 07/09] arm64: dts: renesas: ebisu: Introduce keepipmmu boot parameter
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

Introduce a keepipmmu boot paramenter to let the user override.

Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- 0001/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
+++ work/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts	2019-02-20 23:27:36.595392808 +0900
@@ -19,7 +19,7 @@
 	};
 
 	chosen {
-		bootargs = "ignore_loglevel";
+		bootargs = "keepipmmu ignore_loglevel";
 		stdout-path = "serial0:115200n8";
 	};
 
