Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53767C433ED
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 20 Apr 2021 04:31:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 35C3E61354
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 20 Apr 2021 04:31:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbhDTEby (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 20 Apr 2021 00:31:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbhDTEbx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Apr 2021 00:31:53 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1618EC06174A
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Apr 2021 21:31:23 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id p2so10297697pgh.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Apr 2021 21:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=NMbNJhDqA2zq7upWnQQeypZqWAMwhPHBtmQZRkPW1EU=;
        b=ehAyZmBKdeC6G9aXLJ+4hHSvIYiFkjmH/UBEXrUoR2FQo6GeWcTA34mDu/uBz9e3vg
         JzX9odZuCSjgf3kgukUkx2m884txUVMoxNnQBUegDV1jQKe3GxHgLHk/qt3NkNTTQBp7
         xznr8Y0o82OwOqMZ/U73pe7cuMounvEN6L7BQnWOk0SBWx1qqncPWLjBxlYWHSmZCukw
         bUNruoasoHHMq+vyQKcwcjwIU61+vK8qIf7WNV/SVVbUqZaZe3+aQX1Mgj5KYvfoOyxj
         75dv8gz8diRROsQGdGGc96VyFJ3F8y2pfzqe8tn1EzYdx1OVUHlARqQt/abdlSWtp8TG
         OPtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=NMbNJhDqA2zq7upWnQQeypZqWAMwhPHBtmQZRkPW1EU=;
        b=mfjjxG9cPiFQVC6q2lXwbxoMZyC3+XlEp5PUr5NqLQEnpQ8bzCUInBNHzhFIFxnHIR
         Tnt05sunUr9rpuUJq94GX7WDjBjAWq/pgCzLbeyqMZo3PkN0IuGD2VwBgCoFFlDn5IkK
         ZTjsDhHydzgHJCkOjrjon3S4UavUpT6IZ3+9OZABNvjx9TYf1YAw/0VDfQEQfdSN3kOy
         rpaANoeJESTs3mYdsU19Y9C6gFnEiuUTiKUdUjvEKq6Bsa69fxUcAB/aUp6Jn46qMHal
         8B21phvM3I69mrHw7QFvQTmjoqea3HBy2va+fDJgk8q2roICLv657Z55xmPzAOMdNtwk
         V/3A==
X-Gm-Message-State: AOAM530E2yhX5WfiHZfgnPJNmudlbpzIFs6BStwrNC9UQrWozDSJclqa
        46m//B9ZeljYLtkusQZI2TU5jbt+TBMnOA==
X-Google-Smtp-Source: ABdhPJwEnzK6sJRtOq7PHIfYzzmXzOOo6TuQi6vsmDUEHkMB7APJFjo/OaVNY8sBiSYcwTcTZ14Beg==
X-Received: by 2002:a63:6ec3:: with SMTP id j186mr14830668pgc.249.1618893082358;
        Mon, 19 Apr 2021 21:31:22 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w1sm14541626pgp.31.2021.04.19.21.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 21:31:22 -0700 (PDT)
Message-ID: <607e591a.1c69fb81.b9c81.6d86@mx.google.com>
Date:   Mon, 19 Apr 2021 21:31:22 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: renesas-devel-2021-04-19-v5.12-rc8
X-Kernelci-Report-Type: test
X-Kernelci-Tree: renesas
X-Kernelci-Branch: master
Subject: renesas/master baseline-nfs: 16 runs,
 1 regressions (renesas-devel-2021-04-19-v5.12-rc8)
To:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas/master baseline-nfs: 16 runs, 1 regressions (renesas-devel-2021-04-=
19-v5.12-rc8)

Regressions Summary
-------------------

platform              | arch  | lab          | compiler | defconfig | regre=
ssions
----------------------+-------+--------------+----------+-----------+------=
------
meson-gxm-khadas-vim2 | arm64 | lab-baylibre | gcc-8    | defconfig | 1    =
      =


  Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/rene=
sas-devel-2021-04-19-v5.12-rc8/plan/baseline-nfs/

  Test:     baseline-nfs
  Tree:     renesas
  Branch:   master
  Describe: renesas-devel-2021-04-19-v5.12-rc8
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel.git
  SHA:      a07b5a56e02f9a237f18f2335bd7f029b63739e3 =



Test Regressions
---------------- =



platform              | arch  | lab          | compiler | defconfig | regre=
ssions
----------------------+-------+--------------+----------+-----------+------=
------
meson-gxm-khadas-vim2 | arm64 | lab-baylibre | gcc-8    | defconfig | 1    =
      =


  Details:     https://kernelci.org/test/plan/id/607e2a576bfff9263d9b7799

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-19-v5.12-rc8/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-meson-g=
xm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//renesas/master/renesas-devel-2=
021-04-19-v5.12-rc8/arm64/defconfig/gcc-8/lab-baylibre/baseline-nfs-meson-g=
xm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/buster/2021=
0412.0/arm64/initrd.cpio.gz =



  * baseline-nfs.login: https://kernelci.org/test/case/id/607e2a576bfff9263=
d9b779a
        new failure (last pass: renesas-devel-2021-04-05-v5.12-rc6) =

 =20
