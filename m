Return-Path: <SRS0=sDbg=P5=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED00AC7113B
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Jan 2019 12:16:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BB0BC20879
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Jan 2019 12:16:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h51tIO6H"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728281AbfAUMQE (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 21 Jan 2019 07:16:04 -0500
Received: from mail-pf1-f175.google.com ([209.85.210.175]:33726 "EHLO
        mail-pf1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728216AbfAUMQE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jan 2019 07:16:04 -0500
Received: by mail-pf1-f175.google.com with SMTP id c123so10088775pfb.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Jan 2019 04:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:subject;
        bh=+zgbfhBv7xKrqQdQ46l+BYkUQyNdS1fvLuTXJYV7aSM=;
        b=h51tIO6HxfpmREbZFm/iWzFzkrnEvkA8WJlTR+kIf1r4ge/oMpfngQSuAVPRGmMrrA
         5lmvBzc//goCI22sJRVRwoVPoTLnubZmEoISlbSzJRrqst9JsgL2KGKZHocVCbNqc3ni
         CW7r71BjX569PagNvj1OPFvlUSOkRL5tjnWN4P9vaQ9c+mu93mxNDGCcWhpyx69mtHqi
         zFMPsgFyZ9OrAp/AuT+B1NUcgwsQ8pjeBxUAduxMeN3pNZQ+BwY7pMSTJB30dQqxFjwa
         TV2SZaEDlZKKorklAS5GZkkOPCvOKzTKM7H1SVSgRv7b+rZ0cZhmO3imH3rZpafTHHcQ
         2uIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:subject;
        bh=+zgbfhBv7xKrqQdQ46l+BYkUQyNdS1fvLuTXJYV7aSM=;
        b=IlyVGlTajdlUJt0CvCG7C5VSVrMd/VRAL0Zoasdp9kGZqvslyyVwrPI0WCH921Z5//
         8Ra7YuWfaDBtM5Ybx/t8KnMd2tvI5Z6h6FhuzHWiGnSOzLdXWROnF7HGDQ5MwkB1OE0v
         8a+jOT0+c4cfLyDkuKOyWg5yqcP1Kf3D7+l8rCImp4lsvIV1cEL5NpNEa08SO9zuebYQ
         jk4sq4z6S39q8wE0evfR5mgsulINURYvYY2wF6IADj5ZIU7xzqb/wG1kwz1Jgsu/ArsQ
         UtnbObA5hKlg0P2P2sF9rzi3/xJLhFDu5EQuXED3/wy6C+ZNgMW4nH8+dnKxVSu+JHnP
         Ne1g==
X-Gm-Message-State: AJcUukdVWNeNZR9SgSf0FfbxcLKbj2klC/FuPfMIW5A6n0Po8p3WxJ4v
        ffCVXMRpmZ5IFOrQXLMubHfF3o6S
X-Google-Smtp-Source: ALg8bN5QpSc2zf96o65RV2lgBLJrjT/EumOjyF4DjAIUmZVRxJEVDlvL+BCztiFnQ1DKqr33GU3aLQ==
X-Received: by 2002:a65:5c4b:: with SMTP id v11mr27843435pgr.333.1548072963296;
        Mon, 21 Jan 2019 04:16:03 -0800 (PST)
Received: from [127.0.0.1] (30.net042126252.t-com.ne.jp. [42.126.252.30])
        by smtp.gmail.com with ESMTPSA id q7sm14520440pgp.40.2019.01.21.04.16.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Jan 2019 04:16:02 -0800 (PST)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <magnus.damm@gmail.com>
Date:   Mon, 21 Jan 2019 21:16:43 +0900
Message-Id: <154807300302.2406.14245640502137089757.sendpatchset@octo>
Subject: [PATCH/RFC 00/06] R-Car Gen3 IMP-X5 prototype code
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

R-Car Gen3 IMP-X5 prototype code

[PATCH/RFC 01/06] Prototype code for IMP-X5
[PATCH/RFC 02/06] arm64: dts: renesas: r8a7795: One IMP-X5 device for R-Car H3
[PATCH/RFC 03/06] arm64: dts: renesas: r8a7796: One IMP-X5 device for R-Car M3-W
[PATCH/RFC 04/06] arm64: dts: renesas: r8a77965: One IMP-X5 device for R-Car M3-N
[PATCH/RFC 05/06] arm64: dts: renesas: r8a77970: One IMP-X5 device for R-Car V3M
[PATCH/RFC 06/06] arm64: dts: renesas: r8a77980: One IMP-X5 device for R-Car V3H

These patches temporarily introduce a IMP-X5 driver that uses Runtime PM
to control clocks and power when trying to access the device.

The user should check console printouts and comment out Run-time PM
bits of the code with/without power domain DT information to verify that
register settings are changed as expected. Per-SoC modifications of the
Clock, Reset and Power domain code may be required.

Not intended for upstream merge. Written for H3 ES2 ULCB.

Created as an example of how to test power domains for a certain device.
I hope to use this approach to test IPMMU power domain support in the future.

Not-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Developed on top of v5.0-rc3
 
 arch/arm64/boot/dts/renesas/r8a7795.dtsi  |    9 +++
 arch/arm64/boot/dts/renesas/r8a7796.dtsi  |    9 +++
 arch/arm64/boot/dts/renesas/r8a77965.dtsi |    9 +++
 arch/arm64/boot/dts/renesas/r8a77970.dtsi |    9 +++
 arch/arm64/boot/dts/renesas/r8a77980.dtsi |    9 +++
 drivers/soc/renesas/Makefile              |    2 
 drivers/soc/renesas/renesas-test-imp-x5.c |   77 +++++++++++++++++++++++++++++
 7 files changed, 123 insertions(+), 1 deletion(-)
