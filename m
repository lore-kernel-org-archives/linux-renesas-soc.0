Return-Path: <SRS0=VX+A=O3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2BB8C43387
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Dec 2018 23:25:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 80588217D9
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Dec 2018 23:25:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726752AbeLRXZj (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 18 Dec 2018 18:25:39 -0500
Received: from mga02.intel.com ([134.134.136.20]:39366 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726590AbeLRXZi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Dec 2018 18:25:38 -0500
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Dec 2018 15:25:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,370,1539673200"; 
   d="gz'50?scan'50,208,50";a="131092080"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 18 Dec 2018 15:25:34 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1gZOk1-0000kB-57; Wed, 19 Dec 2018 07:25:33 +0800
Date:   Wed, 19 Dec 2018 07:25:17 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     kbuild-all@01.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [renesas-drivers:master 12/38]
 drivers/gpu//drm/i915/i915_gem.c:2562:19: error: called object
 'totalram_pages' is not a function or function pointer
Message-ID: <201812190754.osndhBkU%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="45Z9DzgjV8m4Oswq"
Content-Disposition: inline
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
head:   bb4f21f1ae06af0da93077b493a550d472bf18ac
commit: e4da156335d4cc6a6da53aa74409fbfe12c9d684 [12/38] Merge remote-tracking branch 'drm/drm-next' into renesas-drivers
config: i386-defconfig (attached as .config)
compiler: gcc-7 (Debian 7.3.0-1) 7.3.0
reproduce:
        git checkout e4da156335d4cc6a6da53aa74409fbfe12c9d684
        # save the attached .config to linux build tree
        make ARCH=i386 

All errors (new ones prefixed by >>):

   drivers/gpu//drm/i915/i915_gem.c: In function 'i915_gem_object_get_pages_gtt':
>> drivers/gpu//drm/i915/i915_gem.c:2562:19: error: called object 'totalram_pages' is not a function or function pointer
     if (page_count > totalram_pages())
                      ^~~~~~~~~~~~~~
   In file included from include/linux/shmem_fs.h:6:0,
                    from drivers/gpu//drm/i915/i915_drv.h:47,
                    from drivers/gpu//drm/i915/i915_gem.c:31:
   include/linux/swap.h:313:22: note: declared here
    extern unsigned long totalram_pages;
                         ^~~~~~~~~~~~~~

vim +/totalram_pages +2562 drivers/gpu//drm/i915/i915_gem.c

  2532	
  2533	static int i915_gem_object_get_pages_gtt(struct drm_i915_gem_object *obj)
  2534	{
  2535		struct drm_i915_private *dev_priv = to_i915(obj->base.dev);
  2536		const unsigned long page_count = obj->base.size / PAGE_SIZE;
  2537		unsigned long i;
  2538		struct address_space *mapping;
  2539		struct sg_table *st;
  2540		struct scatterlist *sg;
  2541		struct sgt_iter sgt_iter;
  2542		struct page *page;
  2543		unsigned long last_pfn = 0;	/* suppress gcc warning */
  2544		unsigned int max_segment = i915_sg_segment_size();
  2545		unsigned int sg_page_sizes;
  2546		struct pagevec pvec;
  2547		gfp_t noreclaim;
  2548		int ret;
  2549	
  2550		/*
  2551		 * Assert that the object is not currently in any GPU domain. As it
  2552		 * wasn't in the GTT, there shouldn't be any way it could have been in
  2553		 * a GPU cache
  2554		 */
  2555		GEM_BUG_ON(obj->read_domains & I915_GEM_GPU_DOMAINS);
  2556		GEM_BUG_ON(obj->write_domain & I915_GEM_GPU_DOMAINS);
  2557	
  2558		/*
  2559		 * If there's no chance of allocating enough pages for the whole
  2560		 * object, bail early.
  2561		 */
> 2562		if (page_count > totalram_pages())
  2563			return -ENOMEM;
  2564	
  2565		st = kmalloc(sizeof(*st), GFP_KERNEL);
  2566		if (st == NULL)
  2567			return -ENOMEM;
  2568	
  2569	rebuild_st:
  2570		if (sg_alloc_table(st, page_count, GFP_KERNEL)) {
  2571			kfree(st);
  2572			return -ENOMEM;
  2573		}
  2574	
  2575		/*
  2576		 * Get the list of pages out of our struct file.  They'll be pinned
  2577		 * at this point until we release them.
  2578		 *
  2579		 * Fail silently without starting the shrinker
  2580		 */
  2581		mapping = obj->base.filp->f_mapping;
  2582		mapping_set_unevictable(mapping);
  2583		noreclaim = mapping_gfp_constraint(mapping, ~__GFP_RECLAIM);
  2584		noreclaim |= __GFP_NORETRY | __GFP_NOWARN;
  2585	
  2586		sg = st->sgl;
  2587		st->nents = 0;
  2588		sg_page_sizes = 0;
  2589		for (i = 0; i < page_count; i++) {
  2590			const unsigned int shrink[] = {
  2591				I915_SHRINK_BOUND | I915_SHRINK_UNBOUND | I915_SHRINK_PURGEABLE,
  2592				0,
  2593			}, *s = shrink;
  2594			gfp_t gfp = noreclaim;
  2595	
  2596			do {
  2597				cond_resched();
  2598				page = shmem_read_mapping_page_gfp(mapping, i, gfp);
  2599				if (likely(!IS_ERR(page)))
  2600					break;
  2601	
  2602				if (!*s) {
  2603					ret = PTR_ERR(page);
  2604					goto err_sg;
  2605				}
  2606	
  2607				i915_gem_shrink(dev_priv, 2 * page_count, NULL, *s++);
  2608	
  2609				/*
  2610				 * We've tried hard to allocate the memory by reaping
  2611				 * our own buffer, now let the real VM do its job and
  2612				 * go down in flames if truly OOM.
  2613				 *
  2614				 * However, since graphics tend to be disposable,
  2615				 * defer the oom here by reporting the ENOMEM back
  2616				 * to userspace.
  2617				 */
  2618				if (!*s) {
  2619					/* reclaim and warn, but no oom */
  2620					gfp = mapping_gfp_mask(mapping);
  2621	
  2622					/*
  2623					 * Our bo are always dirty and so we require
  2624					 * kswapd to reclaim our pages (direct reclaim
  2625					 * does not effectively begin pageout of our
  2626					 * buffers on its own). However, direct reclaim
  2627					 * only waits for kswapd when under allocation
  2628					 * congestion. So as a result __GFP_RECLAIM is
  2629					 * unreliable and fails to actually reclaim our
  2630					 * dirty pages -- unless you try over and over
  2631					 * again with !__GFP_NORETRY. However, we still
  2632					 * want to fail this allocation rather than
  2633					 * trigger the out-of-memory killer and for
  2634					 * this we want __GFP_RETRY_MAYFAIL.
  2635					 */
  2636					gfp |= __GFP_RETRY_MAYFAIL;
  2637				}
  2638			} while (1);
  2639	
  2640			if (!i ||
  2641			    sg->length >= max_segment ||
  2642			    page_to_pfn(page) != last_pfn + 1) {
  2643				if (i) {
  2644					sg_page_sizes |= sg->length;
  2645					sg = sg_next(sg);
  2646				}
  2647				st->nents++;
  2648				sg_set_page(sg, page, PAGE_SIZE, 0);
  2649			} else {
  2650				sg->length += PAGE_SIZE;
  2651			}
  2652			last_pfn = page_to_pfn(page);
  2653	
  2654			/* Check that the i965g/gm workaround works. */
  2655			WARN_ON((gfp & __GFP_DMA32) && (last_pfn >= 0x00100000UL));
  2656		}
  2657		if (sg) { /* loop terminated early; short sg table */
  2658			sg_page_sizes |= sg->length;
  2659			sg_mark_end(sg);
  2660		}
  2661	
  2662		/* Trim unused sg entries to avoid wasting memory. */
  2663		i915_sg_trim(st);
  2664	
  2665		ret = i915_gem_gtt_prepare_pages(obj, st);
  2666		if (ret) {
  2667			/*
  2668			 * DMA remapping failed? One possible cause is that
  2669			 * it could not reserve enough large entries, asking
  2670			 * for PAGE_SIZE chunks instead may be helpful.
  2671			 */
  2672			if (max_segment > PAGE_SIZE) {
  2673				for_each_sgt_page(page, sgt_iter, st)
  2674					put_page(page);
  2675				sg_free_table(st);
  2676	
  2677				max_segment = PAGE_SIZE;
  2678				goto rebuild_st;
  2679			} else {
  2680				dev_warn(&dev_priv->drm.pdev->dev,
  2681					 "Failed to DMA remap %lu pages\n",
  2682					 page_count);
  2683				goto err_pages;
  2684			}
  2685		}
  2686	
  2687		if (i915_gem_object_needs_bit17_swizzle(obj))
  2688			i915_gem_object_do_bit_17_swizzle(obj, st);
  2689	
  2690		__i915_gem_object_set_pages(obj, st, sg_page_sizes);
  2691	
  2692		return 0;
  2693	
  2694	err_sg:
  2695		sg_mark_end(sg);
  2696	err_pages:
  2697		mapping_clear_unevictable(mapping);
  2698		pagevec_init(&pvec);
  2699		for_each_sgt_page(page, sgt_iter, st) {
  2700			if (!pagevec_add(&pvec, page))
  2701				check_release_pagevec(&pvec);
  2702		}
  2703		if (pagevec_count(&pvec))
  2704			check_release_pagevec(&pvec);
  2705		sg_free_table(st);
  2706		kfree(st);
  2707	
  2708		/*
  2709		 * shmemfs first checks if there is enough memory to allocate the page
  2710		 * and reports ENOSPC should there be insufficient, along with the usual
  2711		 * ENOMEM for a genuine allocation failure.
  2712		 *
  2713		 * We use ENOSPC in our driver to mean that we have run out of aperture
  2714		 * space and so want to translate the error from shmemfs back to our
  2715		 * usual understanding of ENOMEM.
  2716		 */
  2717		if (ret == -ENOSPC)
  2718			ret = -ENOMEM;
  2719	
  2720		return ret;
  2721	}
  2722	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--45Z9DzgjV8m4Oswq
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
TW3mVPgXeQpwFzPBAQA=

--45Z9DzgjV8m4Oswq--
