Return-Path: <SRS0=Daww=Q3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9DE9C43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Feb 2019 14:56:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7CD942147C
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Feb 2019 14:56:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AGjxkjbX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726345AbfBTO4M (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 20 Feb 2019 09:56:12 -0500
Received: from mail-pg1-f176.google.com ([209.85.215.176]:40793 "EHLO
        mail-pg1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726194AbfBTO4L (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Feb 2019 09:56:11 -0500
Received: by mail-pg1-f176.google.com with SMTP id u9so8461822pgo.7
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Feb 2019 06:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:in-reply-to:references:subject;
        bh=wbQ0d3kg2LMg0kS6qbynyx/gss0Kh6wb0H1Z97UkEBk=;
        b=AGjxkjbXsP0cDN3qvCsgBgDBqaOBj45L9/1jq6W+gYu364/a2HUAr6vb0ArZomielq
         GZIxzlbTP6E6Daz+VUWhvQS//FP7Ja8skXG9gjcmjCODIflpjud5+/j6I9NulQAf8/oe
         s3d8y26kQ2EJ8JNPwLYo7nkTS6/WsULblXCpqsAguaA1nkx73wIwERbTXiNZjq8XBj+7
         AST0RGPXtXw182R9s+KU+h0+NVq90/8ZZN2IS7UT6parKKdiJ6wUl+jD1W3QOPH4CAym
         wNh1edfUXsSM35z2KP+et79tBl3jN2ERLXNZVtLTkkdUD2+HnQTTd9StBJ89v8OgM7gp
         n/Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
         :references:subject;
        bh=wbQ0d3kg2LMg0kS6qbynyx/gss0Kh6wb0H1Z97UkEBk=;
        b=cT2zB1CqxWBx8bZt2jmS+fp0iD9hccsaKl1+W+sdaL5xN2XdnovAqW8nxq9uFbTz/b
         2eg1XbQfE6oJQEKBFHJSHHJUZDrT8uaOwZsg+VjUMudaox+zIyqKsVzcQ+pudMoILzLJ
         3jiSxDynsP8pG7yFIWJnJn4/4hJ0Q3hyeCAHCCfZxzI8NGzrwxxfWDvtZU05cjUESLMB
         GVQsaV8dhVHhiiJE68h1NjK8Pwp6gMOA4QHP65OULtjncvblnNQrdV6cwlVIDQ0Schz6
         gE1Iq64YUri6HxK6SSHLpu8o/C+Cl4BNCsgVKzbgBYFs16qrnhHQvTZzrk04fU9RBRJh
         nI5Q==
X-Gm-Message-State: AHQUAuZnrqxU/1Zy6nZysB9hsn09i0cZTsX+FSZjy9BbzHjjRg85jJgP
        +QN4nBby2rB9Pu53fz7G7Swqgrgr
X-Google-Smtp-Source: AHgI3IYXwuf+Jc9IP1LL9nfzdxsQ7dulygLKdAl38yRsoQSY1Sjc0uAcBtAcleNSdvIstTTfU/ca4A==
X-Received: by 2002:a63:f553:: with SMTP id e19mr28987658pgk.87.1550674570797;
        Wed, 20 Feb 2019 06:56:10 -0800 (PST)
Received: from [127.0.0.1] (s214090.ppp.asahi-net.or.jp. [220.157.214.90])
        by smtp.gmail.com with ESMTPSA id e24sm26661174pfi.153.2019.02.20.06.56.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 Feb 2019 06:56:09 -0800 (PST)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <magnus.damm@gmail.com>
Date:   Wed, 20 Feb 2019 23:57:02 +0900
Message-Id: <155067462222.15971.15183433201073733089.sendpatchset@octo>
In-Reply-To: <155067454871.15971.12157033067057246708.sendpatchset@octo>
References: <155067454871.15971.12157033067057246708.sendpatchset@octo>
Subject: [PATCH/RFC 08/09] arm64: dts: renesas: eagle: Introduce keepipmmu boot parameter
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

Introduce a keepipmmu boot paramenter to let the user override.

Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- 0001/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
+++ work/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts	2019-02-20 23:28:58.798702585 +0900
@@ -19,7 +19,7 @@
 	};
 
 	chosen {
-		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
+		bootargs = "keepipmmu ignore_loglevel rw root=/dev/nfs ip=dhcp";
 		stdout-path = "serial0:115200n8";
 	};
 
