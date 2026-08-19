Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B31353A98
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2026 14:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787149755; cv=none; b=mvoi1tdTVEtH63DlGWr0bMnGUXbpj+CgRLFXquTwF1bPQbUxu4EkyQgPad5mcq1ZKvpzxfPAMSjSKiSDLpcXkobP1RmKq62Xy8gPHnci8/aO3X9KgUDcvN8StVhkWMZgAMctJfNdIj/XsyFxYIxjEqly+xz1OtxzCXBULScSOYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787149755; c=relaxed/simple;
	bh=B+7fFX4ZydD+DRYhZDZhVaEGfxT3f9qC91YcXod3wh8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=W4oCGDzr0w1JH9t00zDvbhuKdPF6tCMca+16VdXFrBDJvXUdduFNaF6/rjMnI7oTwcLdHt3NDnHkBjR1L2CMAi3P4rddEApRtDYxBbfqAxydvNJBibfUm2ZzWGbCgPvF7BSXlv+J0ijlvyHJtvMZfArJfrv3u8Yv+9qevZrEg/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TSmk8Jnl; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TSmk8Jnl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787149745; x=1818685745;
  h=date:from:to:cc:subject:message-id;
  bh=B+7fFX4ZydD+DRYhZDZhVaEGfxT3f9qC91YcXod3wh8=;
  b=TSmk8Jnl2O3Y7JP5eSD8MlQxZX6OY9PfqjRVwB2KJbfXMBeUXw17VmTH
   X8VdAFK5abOs/M0Ys4sD3iKlNvBWDUVwUONda3zggQD69OYLynlvoMUJn
   Xl2Idx2M4LrBvB1xVNLlGyagFzlTLQ7m0F2UDWiJi/DzfbWWBPVMri9mS
   +a3bNwqVWKE5KzWK+bDmlmMwSD80p/WjGMKEjSR8PZQ1zujMCOXwDsySA
   6JUR7M0AU06wlTm4mpdxEO/rT+h0tVBCSAbDj8gBbUMZZDo44Q3pQKp6g
   aymYDpPJ7iAmWj0lQxETcSHtIM2ogu8/2vXhVEBjUYhFd9W1W4T/hhfgx
   A==;
X-CSE-ConnectionGUID: Y1yu+f0uTnaMN8VuegiD8Q==
X-CSE-MsgGUID: I/c2wkuwSoyR4AhVO0I1NA==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="87786501"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="87786501"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 07:29:02 -0700
X-CSE-ConnectionGUID: B8Hy0+/FRvKtlyBgn5LU+A==
X-CSE-MsgGUID: r/DUpqweROakI3kySHanaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="295479064"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 19 Aug 2026 07:29:01 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwhHl-00000000fSk-3U9S;
	Wed, 19 Aug 2026 14:28:57 +0000
Date: Wed, 19 Aug 2026 22:28:41 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Airlie <airlied@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [geert-renesas-drivers:master 13/55]
 drivers/gpu/drm/xe/xe_device.c:51:10: fatal error: 'xe_log.h' file not found
Message-ID: <202608192230.6MHdCZJS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
head:   03fb6a6169e563cfc4ad01bac2578fa412a343d3
commit: 20a18e2d8ff4fe20a2620818fba2a8fca44d7b25 [13/55] Merge remote-tracking branch 'drm/drm-next' into renesas-drivers
config: x86_64-randconfig-003-20260819 (https://download.01.org/0day-ci/archive/20260819/202608192230.6MHdCZJS-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260819/202608192230.6MHdCZJS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608192230.6MHdCZJS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/xe/xe_pci.c:28:10: fatal error: 'xe_log.h' file not found
      28 | #include "xe_log.h"
         |          ^~~~~~~~~~
   1 error generated.
--
>> drivers/gpu/drm/xe/xe_device.c:51:10: fatal error: 'xe_log.h' file not found
      51 | #include "xe_log.h"
         |          ^~~~~~~~~~
   1 error generated.
--
>> drivers/gpu/drm/xe/xe_guc_submit.c:844:12: error: no member named 'multi_queue' in 'struct xe_guc_exec_queue'
     844 |                         q->guc->multi_queue.re_register = true;
         |                         ~~~~~~  ^
   drivers/gpu/drm/xe/xe_guc_submit.c:846:12: error: no member named 'multi_queue' in 'struct xe_guc_exec_queue'
     846 |                         q->guc->multi_queue.re_update = true;
         |                         ~~~~~~  ^
   drivers/gpu/drm/xe/xe_guc_submit.c:862:11: error: no member named 'multi_queue' in 'struct xe_guc_exec_queue'
     862 |                 q->guc->multi_queue.registering_cgp = true;
         |                 ~~~~~~  ^
   drivers/gpu/drm/xe/xe_guc_submit.c:863:11: error: no member named 'multi_queue' in 'struct xe_guc_exec_queue'
     863 |                 q->guc->multi_queue.updating_cgp = false;
         |                 ~~~~~~  ^
   drivers/gpu/drm/xe/xe_guc_submit.c:865:11: error: no member named 'multi_queue' in 'struct xe_guc_exec_queue'
     865 |                 q->guc->multi_queue.updating_cgp = true;
         |                 ~~~~~~  ^
   drivers/gpu/drm/xe/xe_guc_submit.c:866:11: error: no member named 'multi_queue' in 'struct xe_guc_exec_queue'
     866 |                 q->guc->multi_queue.registering_cgp = false;
         |                 ~~~~~~  ^
>> drivers/gpu/drm/xe/xe_guc_submit.c:868:20: error: no member named 'cgp_update_q' in 'struct xe_exec_queue_group'
     868 |         WRITE_ONCE(group->cgp_update_q, q);
         |                    ~~~~~  ^
>> drivers/gpu/drm/xe/xe_guc_submit.c:868:20: error: no member named 'cgp_update_q' in 'struct xe_exec_queue_group'
     868 |         WRITE_ONCE(group->cgp_update_q, q);
         |                    ~~~~~  ^
>> drivers/gpu/drm/xe/xe_guc_submit.c:868:20: error: no member named 'cgp_update_q' in 'struct xe_exec_queue_group'
     868 |         WRITE_ONCE(group->cgp_update_q, q);
         |                    ~~~~~  ^
>> drivers/gpu/drm/xe/xe_guc_submit.c:868:20: error: no member named 'cgp_update_q' in 'struct xe_exec_queue_group'
     868 |         WRITE_ONCE(group->cgp_update_q, q);
         |                    ~~~~~  ^
>> drivers/gpu/drm/xe/xe_guc_submit.c:868:20: error: no member named 'cgp_update_q' in 'struct xe_exec_queue_group'
     868 |         WRITE_ONCE(group->cgp_update_q, q);
         |                    ~~~~~  ^
>> drivers/gpu/drm/xe/xe_guc_submit.c:868:20: error: no member named 'cgp_update_q' in 'struct xe_exec_queue_group'
     868 |         WRITE_ONCE(group->cgp_update_q, q);
         |                    ~~~~~  ^
>> drivers/gpu/drm/xe/xe_guc_submit.c:868:20: error: no member named 'cgp_update_q' in 'struct xe_exec_queue_group'
     868 |         WRITE_ONCE(group->cgp_update_q, q);
         |                    ~~~~~  ^
   drivers/gpu/drm/xe/xe_guc_submit.c:2773:14: error: no member named 'multi_queue' in 'struct xe_guc_exec_queue'
    2773 |         if (q->guc->multi_queue.re_register) {
         |             ~~~~~~  ^
   drivers/gpu/drm/xe/xe_guc_submit.c:2775:11: error: no member named 'multi_queue' in 'struct xe_guc_exec_queue'
    2775 |                 q->guc->multi_queue.re_register = false;
         |                 ~~~~~~  ^
   drivers/gpu/drm/xe/xe_guc_submit.c:2788:29: error: no member named 'cgp_update_q' in 'struct xe_exec_queue_group'
    2788 |                 if (q == READ_ONCE(group->cgp_update_q) &&
         |                                    ~~~~~  ^
   drivers/gpu/drm/xe/xe_guc_submit.c:2788:29: error: no member named 'cgp_update_q' in 'struct xe_exec_queue_group'
    2788 |                 if (q == READ_ONCE(group->cgp_update_q) &&
         |                                    ~~~~~  ^
   drivers/gpu/drm/xe/xe_guc_submit.c:2788:29: error: no member named 'cgp_update_q' in 'struct xe_exec_queue_group'
    2788 |                 if (q == READ_ONCE(group->cgp_update_q) &&
         |                                    ~~~~~  ^
   drivers/gpu/drm/xe/xe_guc_submit.c:2788:29: error: no member named 'cgp_update_q' in 'struct xe_exec_queue_group'
    2788 |                 if (q == READ_ONCE(group->cgp_update_q) &&
         |                                    ~~~~~  ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +51 drivers/gpu/drm/xe/xe_device.c

    21	
    22	#include "display/xe_display.h"
    23	#include "instructions/xe_gpu_commands.h"
    24	#include "regs/xe_gt_regs.h"
    25	#include "regs/xe_regs.h"
    26	#include "xe_bo.h"
    27	#include "xe_bo_evict.h"
    28	#include "xe_configfs.h"
    29	#include "xe_debugfs.h"
    30	#include "xe_defaults.h"
    31	#include "xe_devcoredump.h"
    32	#include "xe_device_sysfs.h"
    33	#include "xe_dma_buf.h"
    34	#include "xe_drm_client.h"
    35	#include "xe_drv.h"
    36	#include "xe_exec.h"
    37	#include "xe_exec_queue.h"
    38	#include "xe_force_wake.h"
    39	#include "xe_ggtt.h"
    40	#include "xe_gt.h"
    41	#include "xe_gt_mcr.h"
    42	#include "xe_gt_printk.h"
    43	#include "xe_gt_sriov_vf.h"
    44	#include "xe_guc.h"
    45	#include "xe_guc_pc.h"
    46	#include "xe_hw_engine_group.h"
    47	#include "xe_hwmon.h"
    48	#include "xe_i2c.h"
    49	#include "xe_irq.h"
    50	#include "xe_late_bind_fw.h"
  > 51	#include "xe_log.h"
    52	#include "xe_mmio.h"
    53	#include "xe_module.h"
    54	#include "xe_nvm.h"
    55	#include "xe_oa.h"
    56	#include "xe_observation.h"
    57	#include "xe_pagefault.h"
    58	#include "xe_pat.h"
    59	#include "xe_pcode.h"
    60	#include "xe_pm.h"
    61	#include "xe_pmu.h"
    62	#include "xe_psmi.h"
    63	#include "xe_pxp.h"
    64	#include "xe_query.h"
    65	#include "xe_ras.h"
    66	#include "xe_shrinker.h"
    67	#include "xe_soc_remapper.h"
    68	#include "xe_survivability_mode.h"
    69	#include "xe_sriov.h"
    70	#include "xe_svm.h"
    71	#include "xe_sysctrl.h"
    72	#include "xe_tile.h"
    73	#include "xe_ttm_stolen_mgr.h"
    74	#include "xe_ttm_sys_mgr.h"
    75	#include "xe_vm.h"
    76	#include "xe_vm_madvise.h"
    77	#include "xe_vram.h"
    78	#include "xe_vram_types.h"
    79	#include "xe_vsec.h"
    80	#include "xe_wait_user_fence.h"
    81	#include "xe_wa.h"
    82	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
