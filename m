Return-Path: <SRS0=Daww=Q3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC4C8C43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Feb 2019 14:55:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 917812147C
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Feb 2019 14:55:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eNPCzdTe"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726531AbfBTOzf (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 20 Feb 2019 09:55:35 -0500
Received: from mail-pg1-f173.google.com ([209.85.215.173]:33182 "EHLO
        mail-pg1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726524AbfBTOzf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Feb 2019 09:55:35 -0500
Received: by mail-pg1-f173.google.com with SMTP id h11so9633544pgl.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Feb 2019 06:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:in-reply-to:references:subject;
        bh=egSze/Bsn9btA4LRGO6p00Yvo56Wq2hCm3CGMMPZDI4=;
        b=eNPCzdTeEdyrIQ6m97tFdlt+jmAkF6m0XU8VsLFy/CA2mDq4LQ8yqmq3LF5HJGNLNI
         jjLGfOTi1mynx5yFmW66+JeawAQqA6BW5Aopvtx+TD0P1Od1nfU5fIIaadZ23Hov5crM
         sOili2+ym8HcZSDeu9W+1nm5GEWZXvwIahyV4F5/uQ+rGdIkobzFkyuZgmyJMn9U1Wj8
         HeexEMMJbBb9+bPt2T7AD+/z4TQFW0zVUAHRpKlvkbhT+qAK3Cgu/hDr+LpRf+aVKWeJ
         H50TUEg/80PF1Y3H5YKGeWn2Te43AzJ3P8uVGJtFdi/CpC7SiqBOdqBkN4o9OZJwQamq
         ifBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
         :references:subject;
        bh=egSze/Bsn9btA4LRGO6p00Yvo56Wq2hCm3CGMMPZDI4=;
        b=ZL6/iF6gQVgqWrj2XQqw3COuBhDHdXTSB4vufNPTsiCjq/g9PVbStFlvEwtnehiE/N
         gRiivPKNIyu5Zz1OB0YATmT4TF/0nOZyt+Ewz1fS3BJTvblpc2gxwcbHCLHcIpd3SLBd
         jwc8kJY0k9ePe6U3LDYtZXCys16cfy4/z32CtXzTm2J59zzqGDxNZIC6bbluOBMlyZQ7
         L+tfH3/xiTz5syP0jmEm9n2D6GcvQajRwijKzf8nrk35B/MDXAwDVQ59TyhGIeH/twjM
         iJ7P/UhohIyYs+deXQCHAXRDa634iIG7PnwdqgqACk2hwZKHJrluqQRr+igF493DSAE1
         OSBg==
X-Gm-Message-State: AHQUAubuJrcymT091iS9iNxht/qUg2FuAbWOFmITwQ5v5c1aAuvh83+z
        VN0oAtUAthB4HhI3oGvuHJHH6ngi
X-Google-Smtp-Source: AHgI3IZXOvK7h7H2LpYkOzGE32CFDgJ00GXVLuDkBbTNMC37uzwCImny+OU5pBxqoMJ7SKeq9fBhHw==
X-Received: by 2002:a63:234c:: with SMTP id u12mr25489685pgm.282.1550674534134;
        Wed, 20 Feb 2019 06:55:34 -0800 (PST)
Received: from [127.0.0.1] (s214090.ppp.asahi-net.or.jp. [220.157.214.90])
        by smtp.gmail.com with ESMTPSA id v6sm20992894pfb.149.2019.02.20.06.55.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 Feb 2019 06:55:33 -0800 (PST)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <magnus.damm@gmail.com>
Date:   Wed, 20 Feb 2019 23:56:25 +0900
Message-Id: <155067458587.15971.13129982607387612657.sendpatchset@octo>
In-Reply-To: <155067454871.15971.12157033067057246708.sendpatchset@octo>
References: <155067454871.15971.12157033067057246708.sendpatchset@octo>
Subject: [PATCH/RFC 04/09] arm64: dts: renesas: ulcb: Introduce keepipmmu boot parameter
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

Introduce a keepipmmu boot paramenter to let the user override.

Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm64/boot/dts/renesas/ulcb.dtsi |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- 0001/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ work/arch/arm64/boot/dts/renesas/ulcb.dtsi	2019-02-20 23:23:07.594289512 +0900
@@ -26,7 +26,7 @@
 	};
 
 	chosen {
-		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
+		bootargs = "keepipmmu ignore_loglevel rw root=/dev/nfs ip=dhcp";
 		stdout-path = "serial0:115200n8";
 	};
 
