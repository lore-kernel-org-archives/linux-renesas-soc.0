Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775873AE1A5
	for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Sep 2026 10:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789035272; cv=none; b=ld3f1y7wByAuUUWdoOgrh1XeleUFrPTKzvlDTjXocowkLpTnxg2pH7rUnodtzeKq3j97wymrdLby7WAX7l86OK4JpZjQ6ApbrYKfsuNcBuzw3UZpc0DjHnk/bcWPbE7ub8PWKj7+k0VOJYxqzhAnOt66xhhBgzAjIdgSrgV9pqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789035272; c=relaxed/simple;
	bh=Rw5xn6MDUzprJXALhd12R93b+y4cMokXqUcGPM/Ln7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jj4m40dfChmIlyfVgjuLBss24MFAWxkJUPtkvRYMLnprry6WT0EDBLU+6InY11soUqJ9dOgDodrQFm3GOZquxAYcyGhb/vO6rZkOrhup9pAgJJEUGUSEkLAN4to94XSUNE9rxvmMviUzT+fAZw/KFzztDshDIBW8XLk8fduTfbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5c2c46a428eso5482905e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Sep 2026 03:14:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789035269; x=1789640069;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R5pyFaModjtGkctdZvggQo6mIBpUFRdaaBsGlklIYms=;
        b=TM4irxvArq+sYB8aD1DJaJBFuRtRnvCOxUv/m2/tVJCyqPeoaH8hRxzHa5UA1g4kth
         YWk+EEmiVOb/VbxIB/D/ImCkS8o3jVYOBTZmXXhWS0ZYqcVOIubD3PP3ejYfldpHofsE
         9yK89VLByPpA5iQkGhh+jrwLpN2jy4tHHOg3n9ZRBvnlqYHhsqg2jSUkWOaYeT4bWidt
         wyBAdd+lsj4TRRXzfjKme1DqhNJ91srS+L3Es3bUJSSB1I77ShbN//34QZznsNwjbWBN
         9NPgvePy8xJO9Aky6eZdTMh3JG90maVmFBxWsp02SblXufYdM6HXpP+qGyvKaQjGhsKA
         uDhQ==
X-Forwarded-Encrypted: i=1; AKwUvBypr4D/jpu3bo4/VvH32jQpLe3ljm/W+31SP9xLLM1GruYGbp3lLVWRpFWSYhCNkfuBbqnvV+QNQ1OH6zbvLM8DnA==@vger.kernel.org
X-Gm-Message-State: AFuF++kiqB36iAJfeL3/RGg/4Y07ZvPdoTnTXYrn0OEtmbKtBZyhtzyh
	R0i2GSFCoLRForDGOxWy7RQEEuwQpP26hkfTD+62eICt3CC7rj4PBUjzrswL7ShCiUc=
X-Gm-Gg: AYBFou0h2k3BqM+FzKoteUP/tHBUgAg48poAB6Oj/KkKpmhHDOGD918QZG5iip3hKyE
	FqquekEqP467F5se+0uZH6gr0nqlmajaGxCMI3cktlmftcEjJ7TJ0/BOTV+edH04wG7Ped4Smdk
	YZsqxBDu91gEhRBw1ZBw7KI2aPpwph6sKWGSNIoECaj0GlpN5gaKNGiW3K/0M+or6Pu05QIEefs
	c+Vxj/yLCY9TYePRB0dGTxmsR+Ahf7LDrggbbofG1mfMVZTrkolkvxCh90wJVfuVhbRCtg3GOT7
	JcASUMmB5OPaUHdbpYelBUa6JtMjUUHqffdbUysYyO5BqTV0aXBFWBbR5aQy8wp87i8G//FKQfp
	h8FiOAbxKm3tm36dmIdB9ZydmVe8djZ/iWmjxtVUuyMY+cE96wmZCz2dSnQrLAGJJ25vz9n57Vg
	FcG/Wo+nKu1d3OAY3LnrEVLGgKYMDY1HXKdkpdidUiBOTbcrMLQWyYwhQXd5ojeTePmNLRWbIcv
	pCTtKvoNbEcbAUuJOt0kpHn547uaMQ3ZsYF
X-Received: by 2002:a05:6122:6213:b0:5c5:ad20:1fc3 with SMTP id 71dfb90a1353d-5c7ed7671b2mr23140827e0c.5.1789035269157;
        Thu, 10 Sep 2026 03:14:29 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec23d459sm14677692e0c.9.2026.09.10.03.14.28
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 03:14:28 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-746d77537f8so4204229137.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Sep 2026 03:14:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBznQGH9n38/qBTQNkLmCxCdxMZR7C9hreubx1i2sQrI/tRIVD01/xtg4hiOkU6fOZI7+zsFQ03JIfmqDDJOoDafbA==@vger.kernel.org
X-Received: by 2002:a05:6102:6b03:b0:77b:ae7:1bba with SMTP id
 ada2fe7eead31-78a4a72eac3mr22223768137.3.1789035268749; Thu, 10 Sep 2026
 03:14:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202609101334.xgbNoC4e-lkp@intel.com>
In-Reply-To: <202609101334.xgbNoC4e-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Sep 2026 12:14:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVBFCKA5gjQeXuTrOYbaY_sZg-Gnz-fgOCSKhF3cV8jhg@mail.gmail.com>
X-Gm-Features: AcwNN1WahnoAKM5bWAzumRTegPpUxaUzjYyd7D5gHP2WgaVBSlpot3X8X8LLi68
Message-ID: <CAMuHMdVBFCKA5gjQeXuTrOYbaY_sZg-Gnz-fgOCSKhF3cV8jhg@mail.gmail.com>
Subject: Re: [geert-renesas-drivers:renesas-clk-for-v7.4 16/16]
 drivers/clk/renesas/r9a09g077-cpg.c:966:35: error: use of undeclared
 identifier '__free_kfree'; did you mean '__free_pages'?
To: kernel test robot <lkp@intel.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"

Hi Kernel Test Robot,

On Thu, 10 Sept 2026 at 07:34, kernel test robot <lkp@intel.com> wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v7.4
> head:   810b8b6c4e02c40991c29491cec09ebdaf5ec6d0
> commit: 810b8b6c4e02c40991c29491cec09ebdaf5ec6d0 [16/16] clk: renesas: r9a09g077: Register SYSC regmap
> config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260910/202609101334.xgbNoC4e-lkp@intel.com/config)
> compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project c1872e7fd3307679a2da53f9d83de0ccf234b4ad)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260910/202609101334.xgbNoC4e-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202609101334.xgbNoC4e-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> drivers/clk/renesas/r9a09g077-cpg.c:966:35: error: use of undeclared identifier '__free_kfree'; did you mean '__free_pages'?
>      966 |         struct regmap_config *regmap_cfg __free(kfree) = kzalloc_obj(*regmap_cfg);
>          |                                          ^~~~~~~~~~~~~
>    include/linux/cleanup.h:213:33: note: expanded from macro '__free'
>      213 | #define __free(_name)   __cleanup(__free_##_name)
>          |                                   ^~~~~~~~~~~~~~
>    <scratch space>:3:1: note: expanded from here
>        3 | __free_kfree
>          | ^~~~~~~~~~~~
>    include/linux/gfp.h:342:13: note: '__free_pages' declared here
>      342 | extern void __free_pages(struct page *page, unsigned int order);
>          |             ^
> >> drivers/clk/renesas/r9a09g077-cpg.c:966:35: error: 'cleanup' function '__free_pages' must take 1 parameter
>      966 |         struct regmap_config *regmap_cfg __free(kfree) = kzalloc_obj(*regmap_cfg);
>          |                                          ^
>    include/linux/cleanup.h:213:33: note: expanded from macro '__free'
>      213 | #define __free(_name)   __cleanup(__free_##_name)
>          |                                   ^
>    <scratch space>:3:1: note: expanded from here
>        3 | __free_kfree
>          | ^
> >> drivers/clk/renesas/r9a09g077-cpg.c:966:51: error: call to undeclared function 'kzalloc_obj'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>      966 |         struct regmap_config *regmap_cfg __free(kfree) = kzalloc_obj(*regmap_cfg);
>          |                                                          ^
> >> drivers/clk/renesas/r9a09g077-cpg.c:966:24: error: incompatible integer to pointer conversion initializing 'struct regmap_config *' with an expression of type 'int' [-Wint-conversion]
>      966 |         struct regmap_config *regmap_cfg __free(kfree) = kzalloc_obj(*regmap_cfg);
>          |                               ^                          ~~~~~~~~~~~~~~~~~~~~~~~~
>    4 errors generated.

Thanks, will amend with:

+#include <linux/cleanup.h>
+#include <linux/slab.h>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
