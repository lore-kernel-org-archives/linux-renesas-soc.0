Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp-3.sys.kth.se ([130.237.48.192]:39960 "EHLO
        smtp-3.sys.kth.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753946AbcJDNJo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Oct 2016 09:09:44 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Subject: [PATCH 0/3] vsp-tests: extend HGT tests
Date: Tue,  4 Oct 2016 15:09:12 +0200
Message-Id: <20161004130915.28812-1-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

This series extends the vsp-tests with all possible setups for HGT hue 
areas. Please consider it for inclusion in the histogram branch.

Niklas Söderlund (3):
  gen-image: support overlapping hue areas for HGT frames
  tests: add hue area wraparound test for HGT
  tests: add none adjoined hue areas test for HGT

 src/gen-image.c             | 98 ++++++++++++++++++++++++++++++++++++---------
 tests/vsp-unit-test-0018.sh |  4 ++
 2 files changed, 83 insertions(+), 19 deletions(-)

-- 
2.9.3
