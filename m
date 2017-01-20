Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f172.google.com ([209.85.192.172]:36506 "EHLO
        mail-pf0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751257AbdATFzR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Jan 2017 00:55:17 -0500
Received: by mail-pf0-f172.google.com with SMTP id 189so19737272pfu.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Jan 2017 21:54:50 -0800 (PST)
From: Kazunori Kobayashi <kkobayas@igel.co.jp>
To: laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org, dhobsong@igel.co.jp,
        Kazunori Kobayashi <kkobayas@igel.co.jp>
Subject: [RFC PATCH 0/2] drm: rcar-du: Support importing multiple sg table entries via dma-buf
Date: Fri, 20 Jan 2017 14:54:41 +0900
Message-Id: <1484891683-27304-1-git-send-email-kkobayas@igel.co.jp>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch series add support for importing dma-bufs with
multiple sg table entries, exported from other drivers into the DU.
The patches are based on the salvator-x-hdmi-prototype-2016-08-30-v4.8-rc4
topic branch in geert's git repository, which has IOMMU mapping support in
the rcar-du driver.

The current implementation of the rcar-du driver makes use of
the drm_gem_cma_helper APIs because it currently only handles 
physical contiguous memory.
IOMMU support has been added to the rcar-du driver and can map
the framebuffer memory to the IOVA space, so the device has been also capable of
feeding non physical contiguous memory, in other words standard virtual memory
can be handled by mapping multiple sg entries.

The series removes the restriction of only handling a single sg entry
in the dma-buf importing, although continues to use CMA GEM objects even when
importing multiple sg entries in order to coexist with the implementation using
the drm_gem_cma_helper APIs in the rcar-du driver. A generic implementation
for sg table handling independently from CMA GEM objects should be considered,
however has not been finished yet.

I would appreciate any comments if any improvements are necessary for
this series to be accepted upstream.

Kazunori Kobayashi (2):
  drm: rcar-du: Don't create a new sg table for dma-mapping when
    importing other driver's dma-buf
  drm: rcar-du: Allow for handling multiple sg table entries by IOMMU
    mapping

 drivers/gpu/drm/rcar-du/rcar_du_drv.c | 102 ++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c |  28 +++++++---
 2 files changed, 119 insertions(+), 11 deletions(-)

-- 
1.9.1
