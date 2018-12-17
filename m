Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 823FAC43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 14:50:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 50601206A2
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 14:50:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AM/qutds"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732948AbeLQOup (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 09:50:45 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:45043 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731823AbeLQOup (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 09:50:45 -0500
Received: by mail-pl1-f196.google.com with SMTP id e11so5593523plt.11;
        Mon, 17 Dec 2018 06:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=EBS5jiErbocA4COne5tnsTAauHKTVAzalX8cWyLdPi0=;
        b=AM/qutds9GhWMGXsF/Nyg8s1noTC6LXp2nOuF56qj+BUoMrW4Yf2+BumpwxsFNupF0
         XCvcpNhmLYofGw3uVqfdj//k9sCVqRqBz+o+Q8gDxmXcWLLjMremOXvaATPl1R31vHWg
         7bpE5EapyJTDD19QrAHxKpy3faowEe5gL4kTSKebUrVZBHgjImB9R13U/ZKDZRZSOIgG
         YTAbfESIiKrIW4suDXQJHG7tFRAh4fL3HuFITP3r2UGfsjJIhic8BkI+NLRZcTcAsMn0
         RcpNbUn+CeSjY5LTiJResrVY3h8OQoIJQXyLbQVVOC4Aeo7n1U3GOyzTxHUT/ee1zKZa
         FBrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=EBS5jiErbocA4COne5tnsTAauHKTVAzalX8cWyLdPi0=;
        b=hsOV19uHY/F3p8ayMAWQ4nGvEML6FtrvG4XD4wg7bWvJRGB4zEofmhYjZWP41Sn35+
         BNp7U92dtI3r6ngMlCMOYBfXFDCaJTn6jUui5EfvH3vn6bNt0MiD1o25wm/2kk3478WU
         H0cDvxs/0hA2xDvws4JmmI86bytO7gA29vp1t6C47iQV/m0JBLXrYc9zMTYh0lw64l49
         f1Aa4u9udPf/O6/wk7P1Kq0ZtuzNH8ZlvWpLnVjFVEGs2RGNcgYjkXw8+BjtsKxCzVps
         /ktRp16jYUlnAOaW+U3ctMmsWUuJdtxkyCSlo6sf0UTQMmghcEbagUxQ3C2RVhoD5Y7x
         yOew==
X-Gm-Message-State: AA+aEWasYPCkmAFhRir56Q3WIkuKCosX4fY7/SQI6vHdwcaD+9OkW/3a
        1gBEeZfdK2Yrhe8f7g3dWoB9SmLL
X-Google-Smtp-Source: AFSGD/VaixH3J2mw1QIJ3myWj3h38VfgPdUojz8tfn9Kpp/YHf8KTMhYrPlI1V9VtVIB6u38AFzI1A==
X-Received: by 2002:a17:902:e18d:: with SMTP id cd13mr12977349plb.262.1545058243907;
        Mon, 17 Dec 2018 06:50:43 -0800 (PST)
Received: from macc.flets-east.jp (p7732116-ipngn36501marunouchi.tokyo.ocn.ne.jp. [114.158.79.116])
        by smtp.gmail.com with ESMTPSA id v191sm33312081pgb.77.2018.12.17.06.50.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 17 Dec 2018 06:50:43 -0800 (PST)
From:   Yoshihiro Kaneko <ykaneko0929@gmail.com>
To:     linux-pm@vger.kernel.org
Cc:     Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH/RFT v2 0/2] thermal: add suport for R8A77990
Date:   Mon, 17 Dec 2018 23:50:19 +0900
Message-Id: <1545058221-22529-1-git-send-email-ykaneko0929@gmail.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This series adds thermal support for R-Car E3 (R8A77990).

This series is based on the master branch of Linus Torvalds's linux tree.

v2 [Yoshihiro Kaneko]
- Rebased on latest Linus master branch

Yoshihiro Kaneko (2):
  dt-bindings: thermal: rcar-thermal: add R8A77990 support
  thermal: rcar_thermal: add R8A77990 support

 Documentation/devicetree/bindings/thermal/rcar-thermal.txt | 5 +++--
 drivers/thermal/rcar_thermal.c                             | 4 ++++
 2 files changed, 7 insertions(+), 2 deletions(-)

-- 
1.9.1

