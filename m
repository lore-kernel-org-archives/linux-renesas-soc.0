Return-Path: <SRS0=fB+v=V5=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C2A3C433FF
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  1 Aug 2019 14:24:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 226AA20644
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  1 Aug 2019 14:24:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m41sf8Zg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729400AbfHAOYE (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 1 Aug 2019 10:24:04 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:35439 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728129AbfHAOYE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Aug 2019 10:24:04 -0400
Received: by mail-pg1-f194.google.com with SMTP id s1so28004141pgr.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Aug 2019 07:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Awhox3F4tQJJinnTUNEkNON8yyKLtYgh7agQgfIyeSY=;
        b=m41sf8Zg1/5ng3zQdwOqm+l4ssScRYyoqgFETtL298ZQnfrACVAx6DgWO9B+ORdn5L
         tIh+6OgdplqNwS1Rmwx9jjvt6iUlJ+ef4ATq0ItrfLR0VKFIHC9snTEKz6DgjDvPAvBF
         MBr98s/b8pDB9XK9D245HpOJ2zav6WPEgNlqt2LHU6GUgJPpw3QNxAljdMwTenOT/+B3
         7TlQJTBXS4PGr0N0O8XE4oC5+apA0JbKLSEHLQcOhqpyelbKZPu6MVi9n/+oAaxHMraP
         q6PRK/8FAyI2Af73z2mN2EhpzM962cqeWs5QJu22H5vR1VBrEAUzJg81qfLLNqKedNzA
         YmVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Awhox3F4tQJJinnTUNEkNON8yyKLtYgh7agQgfIyeSY=;
        b=U98YVniJk1s1J1o1RblNjWOzAkkwW5FvFAb4Vqx+L7prBdXOuqSpScutiyaPY98DdE
         rdCNH1wHyfquSOSD4+lRhH32kZbk4il4/red2WYInhW5X2GPtGNnknIO4eba+eTbmMYI
         oYbizpZzB38iCsr5C8vTfQaeksvY22c5ue0ya22Fsc2ZQthyuh2uVuMFEdFvKX40K+q+
         8WS8Xmv1bZfMNvc30lDLHV7lcezq+5ASPhWaNKGniDKOHH0kD/cdF3BCKbc0sK3BYwBH
         MueWsPo0mo9gFfcTjGHvY3GQ+mr/iMUzS9c0+LhkqjW4TGS3MRb5qHL13IPnI1xjioaR
         xMbQ==
X-Gm-Message-State: APjAAAUoBfY6rHWr9uG1nvn22jWN0OIzEU/LI/9GN2Nw4IuZB10XzmXh
        lblya73D5x5uQkVlawdeKWQKsxqz
X-Google-Smtp-Source: APXvYqzCHPtdX90V6bs3zx92DwLgxloFoOqGz7sMZeyqiE7sibp9ET/bf7tFBXPW4ALvZrsV6jClfg==
X-Received: by 2002:a17:90a:5884:: with SMTP id j4mr9381708pji.142.1564669443767;
        Thu, 01 Aug 2019 07:24:03 -0700 (PDT)
Received: from localhost.localdomain (p6796086-ipngn28101marunouchi.tokyo.ocn.ne.jp. [114.165.92.86])
        by smtp.gmail.com with ESMTPSA id 201sm86387592pfz.24.2019.08.01.07.24.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 01 Aug 2019 07:24:03 -0700 (PDT)
From:   Yoshihiro Kaneko <ykaneko0929@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: dts: renesas: r8a77980-v3hsk: sort nodes
Date:   Thu,  1 Aug 2019 23:23:52 +0900
Message-Id: <1564669432-22593-1-git-send-email-ykaneko0929@gmail.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Sort nodes.

If node address is present
   * Sort by node address, grouping all nodes with the same compat string
     and sorting the group alphabetically.
Else
   * Sort alphabetically

This should not have any run-time effect.

Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---

This patch is based on the master branch of Geert Uytterhoeven's renesas-devel
tree.

 arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts b/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
index dd14a41..adbfd8f 100644
--- a/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
@@ -22,12 +22,6 @@
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory@48000000 {
-		device_type = "memory";
-		/* first 128MB is reserved for secure area. */
-		reg = <0 0x48000000 0 0x78000000>;
-	};
-
 	hdmi-out {
 		compatible = "hdmi-connector";
 		type = "a";
@@ -63,6 +57,12 @@
 		};
 	};
 
+	memory@48000000 {
+		device_type = "memory";
+		/* first 128MB is reserved for secure area. */
+		reg = <0 0x48000000 0 0x78000000>;
+	};
+
 	osc1_clk: osc1-clock {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
-- 
1.9.1

