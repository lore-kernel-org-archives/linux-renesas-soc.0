Return-Path: <SRS0=XP2S=QL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B645C282C4
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Feb 2019 16:26:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CDFD32083B
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Feb 2019 16:25:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="iSpGVm6b"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729597AbfBDQZ7 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 4 Feb 2019 11:25:59 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36235 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727333AbfBDQZ7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Feb 2019 11:25:59 -0500
Received: by mail-wr1-f66.google.com with SMTP id z3so503350wrv.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Feb 2019 08:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=gj4CO8cKmeYrRRbK9pmA1l2CtkIGPY5k/yuxkvfaR0I=;
        b=iSpGVm6bk6aqVVi6UgCSx6Ltk72BPZUwH9m/dakwPfH66odYZZnNC6MuA7N3jYacPj
         hgi+vjkJTXK0Lyhy+xFs9YpnJg8zyIp/WFMTP8YfHMiZwDwEJcMSXD/ktxxYRtqSXYB4
         3+floKLMmdYOzoFyGWxLCzafuY4mOBR7mIxXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=gj4CO8cKmeYrRRbK9pmA1l2CtkIGPY5k/yuxkvfaR0I=;
        b=tRWsxrCK0BWxSPJsg53tbN7h1chbva6DwT8T6PJPbi8xQNbMLFjrivg9wipBwm9tnh
         GRh1n7Si1CRWZVbF7rYUoWsgUB8oG9J5hi1hOtQqjw+w2J8phcgN3Qlxxp/pdEJetJTW
         WIqOwr0I4RF8n1mPZR3jwrecT8Woit8+eoBokVOZQOuNUAExAuVvcV0p21xcPs0M9nXZ
         JQva0BzIMHwSONgab8cnPAOcx6/eWABtVCzFDlWEH+WvpdjGjfbokV5OLmmFQq+jhuGQ
         AAXdHonu+C2+y3xneF6UjfjPp7I+wzozMQo03qSWq1vtwJA667+GsFqyM+zjnW2UlzMa
         Du1Q==
X-Gm-Message-State: AHQUAuai8RMhyqfnDJdn+haQpUrV7vQEGV6YCkBWFZcXWZ+Qp+J8zzOD
        C7z0CpzIZAXiSoZAW0awLE7miA==
X-Google-Smtp-Source: AHgI3IYguOK+dM/9om6QfOgjjrMG44+JJ3V9kjMBviVQPvGe1GyoA3P+vG/ut4gB+CnLAU/37KPzsg==
X-Received: by 2002:a5d:4e82:: with SMTP id e2mr114174wru.291.1549297557099;
        Mon, 04 Feb 2019 08:25:57 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:f:6020:70b6:b9c6:89e2:36a])
        by smtp.gmail.com with ESMTPSA id a4sm1251992wrt.37.2019.02.04.08.25.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 04 Feb 2019 08:25:56 -0800 (PST)
From:   Vincent Guittot <vincent.guittot@linaro.org>
To:     linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        rjw@rjwysocki.net, ulf.hansson@linaro.org, biju.das@bp.renesas.com
Cc:     linux-arm-kernel@lists.infradead.org, geert@linux-m68k.org,
        thara.gopinath@linaro.org, linux-renesas-soc@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH 0/2] PM-runtime: fix and clean up of time accounting
Date:   Mon,  4 Feb 2019 17:25:51 +0100
Message-Id: <1549297553-17647-1-git-send-email-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Fix time accounting which has the same lock contraint as for using hrtimer
and update accounting_timestamp only when useful.

Vincent Guittot (2):
  PM-runtime: move runtime accounting on ktime_get_mono_fast_ns()
  PM-runtime: update time accounting only when enabled

 drivers/base/power/runtime.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

-- 
2.7.4

