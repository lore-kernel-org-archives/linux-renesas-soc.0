Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from szxga06-in.huawei.com ([45.249.212.32]:34736 "EHLO huawei.com"
        rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S934182AbeFMImK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Jun 2018 04:42:10 -0400
To: <laurent.pinchart@ideasonboard.com>, <airlied@linux.ie>
CC: <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "weiyongjun (A)" <weiyongjun1@huawei.com>
From: YueHaibing <yuehaibing@huawei.com>
Subject: Missing [PATCH] drm/shmob: fix return value check in
 shmob_drm_probe()
Message-ID: <5ffbb7e8-ec5e-ac0e-f95a-7fc12dbc70f8@huawei.com>
Date: Wed, 13 Jun 2018 16:41:51 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

It seems the below patch missing in the torvalds tree.

https://patchwork.kernel.org/patch/9697515/
