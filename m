Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FAFC3BE144
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2026 03:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787110510; cv=none; b=I9huOFcP9VgTUJrxQv8u8HJ+hICdJXRIgXHGJw3OEbQQ29dNeYyS6zDVqGNHuLXyX9j0Qqg2jZd1tPPAqEzLgv7fkUF9QZhd7DCWKHdgoZ4cmEYzN4F5A2gOTKA0KjQDjEjLjR/rp8qZA+t/3Mo18bGL2lsh4g1cjl39fSE+EzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787110510; c=relaxed/simple;
	bh=byQ9+mN5gix4sX3p7MwLeWXlZydKOtDI4F1xDg7GI1Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OcRkPyEvP9IXCv8MSxk5SlQgsoNYVJ7hbryuSHrcnE+FOKHTlyas+v9OjKqIrzO4gfWDF5I4DGG11H3jKfHLL2RoAMY9lM+9vJ5UgMF9rHag1XWMSsWn2a0nzE3tMZW9wpDyLIjk9zzas8NJDlyrsYEdbN1n71sSNxx1kNDXY90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FaJBqgQR; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FaJBqgQR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787110508; x=1818646508;
  h=date:from:to:cc:subject:message-id;
  bh=byQ9+mN5gix4sX3p7MwLeWXlZydKOtDI4F1xDg7GI1Y=;
  b=FaJBqgQRPrQM0HHDa8ixqmvgNY7OcBAxJ18/31D2JDEQNe+bzzp8ytAR
   606Ah9CutnRQLHrFi8bZShMnQBuTXET186XG+u/juAtdkItbxoitDp10y
   AJMukObRRax2BM1NRVX4108qcCf8OO8CYvlnDYyL9YJNBbn1a7yDqjR6q
   HwFI778LK+cQOhvqtMxrbnE01wxmLBXpFujJ4c2PvcMt4nDpZqcAVse3l
   uqmlFx6R+6T03XOhgJBKzxpZpi+33dVoCn0B6vYLYwf+LcLNM7DjeTUps
   qD8Hcgr/YEEUr7DrPUR+3pqkeFqJ4ifYi+KLnsqGZLq5G0hRsEGvUjylG
   Q==;
X-CSE-ConnectionGUID: yN/MVDSIRt6yC6BNCSlF2Q==
X-CSE-MsgGUID: 2qMZDCKrTEemIzD60Ea+bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="110397320"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="110397320"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 20:35:07 -0700
X-CSE-ConnectionGUID: RMS+aBDLQvm9DLI4gU2ZrA==
X-CSE-MsgGUID: DJpcHhmlQPqbfElo4kMMlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="303626716"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 Aug 2026 20:35:07 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwX4x-00000000era-2l4c;
	Wed, 19 Aug 2026 03:35:03 +0000
Date: Wed, 19 Aug 2026 11:34:49 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Airlie <airlied@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [geert-renesas-drivers:master 13/55]
 drivers/gpu/drm/xe/xe_device.c:51:10: fatal error: xe_log.h: No such file or
 directory
Message-ID: <202608191120.4qS1lHiP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
head:   03fb6a6169e563cfc4ad01bac2578fa412a343d3
commit: 20a18e2d8ff4fe20a2620818fba2a8fca44d7b25 [13/55] Merge remote-tracking branch 'drm/drm-next' into renesas-drivers
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20260819/202608191120.4qS1lHiP-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260819/202608191120.4qS1lHiP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608191120.4qS1lHiP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/xe/xe_device.c:51:10: fatal error: xe_log.h: No such file or directory
      51 | #include "xe_log.h"
         |          ^~~~~~~~~~
   compilation terminated.
--
   drivers/gpu/drm/xe/xe_guc_submit.c: In function 'xe_guc_exec_queue_group_cgp_sync':
>> drivers/gpu/drm/xe/xe_guc_submit.c:844:31: error: 'struct xe_guc_exec_queue' has no member named 'multi_queue'
     844 |                         q->guc->multi_queue.re_register = true;
         |                               ^~
   drivers/gpu/drm/xe/xe_guc_submit.c:846:31: error: 'struct xe_guc_exec_queue' has no member named 'multi_queue'
     846 |                         q->guc->multi_queue.re_update = true;
         |                               ^~
   drivers/gpu/drm/xe/xe_guc_submit.c:862:23: error: 'struct xe_guc_exec_queue' has no member named 'multi_queue'
     862 |                 q->guc->multi_queue.registering_cgp = true;
         |                       ^~
   drivers/gpu/drm/xe/xe_guc_submit.c:863:23: error: 'struct xe_guc_exec_queue' has no member named 'multi_queue'
     863 |                 q->guc->multi_queue.updating_cgp = false;
         |                       ^~
   drivers/gpu/drm/xe/xe_guc_submit.c:865:23: error: 'struct xe_guc_exec_queue' has no member named 'multi_queue'
     865 |                 q->guc->multi_queue.updating_cgp = true;
         |                       ^~
   drivers/gpu/drm/xe/xe_guc_submit.c:866:23: error: 'struct xe_guc_exec_queue' has no member named 'multi_queue'
     866 |                 q->guc->multi_queue.registering_cgp = false;
         |                       ^~
   In file included from <command-line>:
>> drivers/gpu/drm/xe/xe_guc_submit.c:868:25: error: 'struct xe_exec_queue_group' has no member named 'cgp_update_q'
     868 |         WRITE_ONCE(group->cgp_update_q, q);
         |                         ^~
   include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:60:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_guc_submit.c:868:9: note: in expansion of macro 'WRITE_ONCE'
     868 |         WRITE_ONCE(group->cgp_update_q, q);
         |         ^~~~~~~~~~
>> drivers/gpu/drm/xe/xe_guc_submit.c:868:25: error: 'struct xe_exec_queue_group' has no member named 'cgp_update_q'
     868 |         WRITE_ONCE(group->cgp_update_q, q);
         |                         ^~
   include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:60:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_guc_submit.c:868:9: note: in expansion of macro 'WRITE_ONCE'
     868 |         WRITE_ONCE(group->cgp_update_q, q);
         |         ^~~~~~~~~~
>> drivers/gpu/drm/xe/xe_guc_submit.c:868:25: error: 'struct xe_exec_queue_group' has no member named 'cgp_update_q'
     868 |         WRITE_ONCE(group->cgp_update_q, q);
         |                         ^~
   include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:60:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_guc_submit.c:868:9: note: in expansion of macro 'WRITE_ONCE'
     868 |         WRITE_ONCE(group->cgp_update_q, q);
         |         ^~~~~~~~~~
>> drivers/gpu/drm/xe/xe_guc_submit.c:868:25: error: 'struct xe_exec_queue_group' has no member named 'cgp_update_q'
     868 |         WRITE_ONCE(group->cgp_update_q, q);
         |                         ^~
   include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:60:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_guc_submit.c:868:9: note: in expansion of macro 'WRITE_ONCE'
     868 |         WRITE_ONCE(group->cgp_update_q, q);
         |         ^~~~~~~~~~
>> drivers/gpu/drm/xe/xe_guc_submit.c:868:25: error: 'struct xe_exec_queue_group' has no member named 'cgp_update_q'
     868 |         WRITE_ONCE(group->cgp_update_q, q);
         |                         ^~
   include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:60:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_guc_submit.c:868:9: note: in expansion of macro 'WRITE_ONCE'
     868 |         WRITE_ONCE(group->cgp_update_q, q);
         |         ^~~~~~~~~~
   In file included from ./arch/arc/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:369,
                    from include/linux/build_bug.h:5,
                    from include/linux/bitfield.h:10,
                    from drivers/gpu/drm/xe/xe_guc_submit.c:8:
>> drivers/gpu/drm/xe/xe_guc_submit.c:868:25: error: 'struct xe_exec_queue_group' has no member named 'cgp_update_q'
     868 |         WRITE_ONCE(group->cgp_update_q, q);
         |                         ^~
   include/asm-generic/rwonce.h:55:27: note: in definition of macro '__WRITE_ONCE'
      55 |         *(volatile typeof(x) *)&(x) = (val);                            \
         |                           ^
   drivers/gpu/drm/xe/xe_guc_submit.c:868:9: note: in expansion of macro 'WRITE_ONCE'
     868 |         WRITE_ONCE(group->cgp_update_q, q);
         |         ^~~~~~~~~~
>> drivers/gpu/drm/xe/xe_guc_submit.c:868:25: error: 'struct xe_exec_queue_group' has no member named 'cgp_update_q'
     868 |         WRITE_ONCE(group->cgp_update_q, q);
         |                         ^~
   include/asm-generic/rwonce.h:55:34: note: in definition of macro '__WRITE_ONCE'
      55 |         *(volatile typeof(x) *)&(x) = (val);                            \
         |                                  ^
   drivers/gpu/drm/xe/xe_guc_submit.c:868:9: note: in expansion of macro 'WRITE_ONCE'
     868 |         WRITE_ONCE(group->cgp_update_q, q);
         |         ^~~~~~~~~~
   drivers/gpu/drm/xe/xe_guc_submit.c: In function 'guc_exec_queue_revert_pending_state_change':
   drivers/gpu/drm/xe/xe_guc_submit.c:2773:19: error: 'struct xe_guc_exec_queue' has no member named 'multi_queue'
    2773 |         if (q->guc->multi_queue.re_register) {
         |                   ^~
   drivers/gpu/drm/xe/xe_guc_submit.c:2775:23: error: 'struct xe_guc_exec_queue' has no member named 'multi_queue'
    2775 |                 q->guc->multi_queue.re_register = false;
         |                       ^~
   drivers/gpu/drm/xe/xe_guc_submit.c:2788:41: error: 'struct xe_exec_queue_group' has no member named 'cgp_update_q'
    2788 |                 if (q == READ_ONCE(group->cgp_update_q) &&
         |                                         ^~
   include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_guc_submit.c:2788:26: note: in expansion of macro 'READ_ONCE'
    2788 |                 if (q == READ_ONCE(group->cgp_update_q) &&
         |                          ^~~~~~~~~
   drivers/gpu/drm/xe/xe_guc_submit.c:2788:41: error: 'struct xe_exec_queue_group' has no member named 'cgp_update_q'
    2788 |                 if (q == READ_ONCE(group->cgp_update_q) &&
         |                                         ^~
   include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_guc_submit.c:2788:26: note: in expansion of macro 'READ_ONCE'
    2788 |                 if (q == READ_ONCE(group->cgp_update_q) &&
         |                          ^~~~~~~~~
   drivers/gpu/drm/xe/xe_guc_submit.c:2788:41: error: 'struct xe_exec_queue_group' has no member named 'cgp_update_q'
    2788 |                 if (q == READ_ONCE(group->cgp_update_q) &&
         |                                         ^~
   include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_guc_submit.c:2788:26: note: in expansion of macro 'READ_ONCE'
    2788 |                 if (q == READ_ONCE(group->cgp_update_q) &&
         |                          ^~~~~~~~~
   drivers/gpu/drm/xe/xe_guc_submit.c:2788:41: error: 'struct xe_exec_queue_group' has no member named 'cgp_update_q'
    2788 |                 if (q == READ_ONCE(group->cgp_update_q) &&
         |                                         ^~
   include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_guc_submit.c:2788:26: note: in expansion of macro 'READ_ONCE'
    2788 |                 if (q == READ_ONCE(group->cgp_update_q) &&
         |                          ^~~~~~~~~
   drivers/gpu/drm/xe/xe_guc_submit.c:2788:41: error: 'struct xe_exec_queue_group' has no member named 'cgp_update_q'
--
>> drivers/gpu/drm/xe/xe_pci.c:28:10: fatal error: xe_log.h: No such file or directory
      28 | #include "xe_log.h"
         |          ^~~~~~~~~~
   compilation terminated.


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
