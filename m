Return-Path: <SRS0=E4fS=PS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EA46C43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 10 Jan 2019 19:02:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3042A20675
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 10 Jan 2019 19:02:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="vkI0mW6l"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728926AbfAJTCm (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 10 Jan 2019 14:02:42 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:35562 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728748AbfAJTCm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Jan 2019 14:02:42 -0500
Received: by mail-lf1-f65.google.com with SMTP id e26so9083400lfc.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Jan 2019 11:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:cc:references:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=I4wFtu4ewvaxtn9SUALdhudsLahKkWpUyBhd3aLO95Y=;
        b=vkI0mW6lVQ250pw/B1OWoAK+ePxx7uw0KGsZ1NDmkCzAKSMOmtPBX2MkdQ23Wbt17S
         toVR6d/KaKnEly8+n88pNM7DYUA6Tl6o7HxUeCkZkN+P6v0NC5w1UnNBVbbPBuqbW/3I
         qOA/nCyYYI9FkL6wtl2dDYX5Fmqs2g95COW7UdUiLQD5JN8P+uwrVjDX/UDb6C/xg4iE
         nxFTx1ozYYu7qyj4nk+RQYkoR+aK6XmQY4YFQPychtQFCxM9IPD/FDdVF1m7oc8fHgXO
         4aTBWHhL/66v6mToFaLafpLVDQNqexZKrC/AoLT8a0CZ79GfZw1SvfICgpXduFsTQcI/
         PfTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=I4wFtu4ewvaxtn9SUALdhudsLahKkWpUyBhd3aLO95Y=;
        b=qJR2hAdp3vN5lWGRuon8+2v8K5ImmGrn17MRgXGQfe1M6H4Sk1V3dzxBo20V/c6bur
         NM3E9djuIBvPacVn1jx467h8VnVKVBtueJm+6meA1eDG+iGAJ03+CET7To1RE4BvhAcJ
         mtK5LZ9N66p0YmaZbcE7x5/PmzutL7VeDNOUA+WnQejmZiH4ZTuO51OmcU9oZXgtYmMO
         ZnfDhfB0EHgngGaDMVubUehjCDWgypVx0W9JTaKIbkLaEE6fxO1z7OfOAOI6EqYUqLvh
         J9NEWAISu/GpmKkV75waNYrI8iw6k4/IHNbGetQVe15VyMwCWCGdvbG1jaLs5sOUHn5y
         SJSA==
X-Gm-Message-State: AJcUukeSMVYwClRexbBj77GOd94NsLKg9hHl6/iKWo5R1pLgt9hGGBln
        Wy+vzKbZtDHcnF/5bWj9tRW7Lw==
X-Google-Smtp-Source: ALg8bN6SBs9BCzOy5LWo/57natk8/xT/nssxLyMa0v2ksb5Xpvo3CYntnDPtm4l3++mTRYOn9Xv2Ow==
X-Received: by 2002:a19:be16:: with SMTP id o22mr6366391lff.22.1547146960437;
        Thu, 10 Jan 2019 11:02:40 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.83.92])
        by smtp.gmail.com with ESMTPSA id g17sm14428911lfg.78.2019.01.10.11.02.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Jan 2019 11:02:39 -0800 (PST)
Subject: [PATCH RFC 1/2] dt-bindings: spi: renesas-rpc: document R8A77970
 bindings
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To:     linux-spi@vger.kernel.org, Mason Yang <masonccyang@mxic.com.tw>,
        Rob Herring <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>
References: <c83b1e54-016f-ef28-6bc9-9be9410c0d9a@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <36b5ecc8-e7df-e351-f267-97a0d94262a1@cogentembedded.com>
Date:   Thu, 10 Jan 2019 22:02:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <c83b1e54-016f-ef28-6bc9-9be9410c0d9a@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document the R-Car V3M (R8A77970) SoC in the Renesas RPC-IF bindings.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 Documentation/devicetree/bindings/spi/spi-renesas-rpc.txt |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

Index: renesas/Documentation/devicetree/bindings/spi/spi-renesas-rpc.txt
===================================================================
--- renesas.orig/Documentation/devicetree/bindings/spi/spi-renesas-rpc.txt
+++ renesas/Documentation/devicetree/bindings/spi/spi-renesas-rpc.txt
@@ -2,7 +2,8 @@ Renesas R-Car Gen3 RPC-IF controller Dev
 ----------------------------------------------------------
 
 Required properties:
-- compatible: should be "renesas,r8a77980-rpc" or
+- compatible: should be "renesas,r8a77970-rpc" or
+  	      	        "renesas,r8a77980-rpc" or
   	      	        "renesas,r8a77995-rpc"
 - #address-cells: should be 1
 - #size-cells: should be 0
