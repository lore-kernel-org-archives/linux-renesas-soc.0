Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62333480DD2
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Aug 2026 14:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786630499; cv=pass; b=sG3FYJsCJZ3pXidlDvEjgK2GjEaGhB6tVEeBB8abVXHKhUWQII3kxDiKIjEyjyFT7fov2p2CVmRiwWOojsuUPVfebeFahALtCVuCAJSheMCme/VdrZRv3ZtLB8fZ8QPZPvfCWjN2L8JRH3936pV1VohUUDAaYM3fWxAcLJ/IkL0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786630499; c=relaxed/simple;
	bh=lXclKkdZKz9tqxvsjth2oei63mDlgbkb248WaZ0u6+c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nhQjhrpFLPaqGluScDEdqbigU4ic8CiPOp+wuB18zDMtoeCk32uycPujlW4L6T+8xXsuvHj5AY2jfC1F//NY3jymod4n26YEhIAYMrWorvmUpLzzLMpov1d76qcNxxTR5UUU4ZNWm/nYlFPTkAIG7wy68Sxzd4b3f70mE225jVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nWyIy2b7; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nWyIy2b7"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4815bce4652so421339f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Aug 2026 07:14:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786630495; cv=none;
        d=google.com; s=arc-20260327;
        b=TdaNMw3k5vAG+jiKdpu8Ith99ntHWTaljkUunqnkb7X0YMoP5mVTI+XiqP3zkTArik
         TS2lGnSSqTAn8mkcMC3Lk5/S/sJ8ApOZNqZFflKSQflJUcLI5kzF6gqnZkHg05TaGVLA
         ASuW7C/agpLv7vt5UhEtAQvwtfYnQBy2xLrgC6U5EGuOiMpfhv00CrOCj+42AqBVH4Jw
         SMdDnt2U/bH4q3BTiFaHtZteqLmkDSp0M+zGJ9B5cP2W3zc8fyfwHGKQXYA04LWrlydk
         TVn24A8GCHFzjifHzrCC23IFo+57yy/UEb82h/2gTen+D80X1v5LUhmq7wY/ZvAADyKG
         2YGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nwVYwS4rkKXuTd204iwL/N56ZQCMjhzJX1zTzeAwLag=;
        fh=ASYkjb6HQXLPrUHzw5cTDjlNIHmaWuzYD1QLNA3wY5w=;
        b=G2gitOzo8dZ/XP66pqYX0vpIZMg8MtDMmr8I45f+m55l3nqdhNk4lnhHtpE061/cFv
         /4zz4jmuaxNry6PyKPczWkwpq8CWtCSUieB+ZgO0wfshXgxywgt3sZwmPwK9ElJjQ+zo
         0niTuU4F5W1lkIESS/4OJwmxWSGUZ/fdzgIjr9s7Uhh8sZWbRLEwdge5fyfiIatwCfWW
         nxc1bfFyxqdoscEyoBSFLdQ7et2vArVLyRjawA08/pUSLvrAIvHwKcrky2xSkLWbK/pm
         Kfh8Joo9KiMSfn70awWITiL5eltAJ6gl7qeK8D3FPaR/l2h6TSyRQSIKxKHUF9m8lqjo
         JXXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786630495; x=1787235295; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nwVYwS4rkKXuTd204iwL/N56ZQCMjhzJX1zTzeAwLag=;
        b=nWyIy2b7sdCzJZgnzUmZKLC0/gAMEAF+2T+T6jtw/czv83tteg7C66cRAyQOjXn8GT
         +fkfwdOnhYvPqC0qOIAchGgjx2on2/rem5VWmUPwcvPmqfU5QoSdmA08ZOCg87DgS51A
         7xUnymKk4qDIpsBOaNFzH4COI7hdTC/tilGg3UtIwCzPvhekVoJqKMRYJ2kO9nmnjolz
         xLGklT94rdsM6Lq6sH40e4lu7IoZYU8lTBp5l1AJJABZ70sLpkd3Amz4rI8wgunE4Pnd
         VggHeKKlOpWrNkjtHIVl4euuB6K8e2KZ1Oufe13zLuWEQ4wZdxYO2B12MBteWejH00Vs
         7JEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786630495; x=1787235295;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nwVYwS4rkKXuTd204iwL/N56ZQCMjhzJX1zTzeAwLag=;
        b=fev/U4WIwwpnwwG3/mInrqPANj1zMJr1Clb34qcfQmCIVeerlTIVC8N7ToBgQQr5BW
         BMVDYAXqKhAJS8kyedQ9wI4Y6iPTpSRUlyAr/r8XHzj23Y6XsJuH5Wc093aSYwgCehVl
         ke/Kv/KPOL8ajsIuZ04A8M75305MinzRee64oRziLq3VL5iCyMWmvYEiUEd7I5scMvdv
         Cum5MIkDcwYlci2GbWWELC8ctYDC9AfvNvdiz7yEZA+5Nso+uUL/ehYiT9zxwRtuVCYx
         nXkSj6OLAVpN9/53DdEUNYzc+MwUAvXk+GU2iJ98iWvMH9vjNdriFsYuupzvR4g2OSuH
         66Dw==
X-Forwarded-Encrypted: i=1; AHgh+RoR7uZMPxEK32mH7qc8EXcLv/OF7Ha6B4FbzI2zMYDg+JZbBMbrt08nD89chVxVJ0zU6HWbfkmKkxr6CbMMTrTotg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeEb5/7zpAMzqJ9PdnXOA/o919siv7VTAD6styvmEmWi/a7i04
	azLd8Qu+lUzjrw+HXdBRfKaws70GvL9YJCmoUFH0gjRa9HtnBqTd9EXqmtypcjx66S2QHisSghn
	CUs3nbnLGcRmDyvauKmKce5ifONMRrLM=
X-Gm-Gg: AR+sD11qp4JopOeq0SFjg02wQgsREfUwx+kFS2RIavjs57cQAlfqHNJwwkF9sebkkfE
	rvoC/bQGRf0hCcxpUvxR0ss0QUC7lKAZcU7QWV4CJJwbN27jafiHP3fWLl2CWH0GScCJPAV5/0O
	4ZYADgKUFbteDYIEI7g2RBR5KwbitwtWm9M2WfQDjzxd4ZV/ft8kl04HJqszRdcq6MSYhIbZVA4
	T/YZKnZ55iehxCloKKWgOkQyIM1O3ZET/qulehswp2riVdGkSrpxXySe8FWDxEcJIMh/UaWRJN+
	oj9tuDN+XvTNF2HPpmC8sJiPknfIEGsLu6kaWaPQ6XD/o9W81uHKoKzvWP+2p5bpj4rOlU6PBjt
	6aZLpzrFm8BVvHecpU3ESLtXqnLlvhCHfxcq71r4gKKXqygNV/EWT3sZ7U+Glp3SkE5heFDNfP3
	g=
X-Received: by 2002:a05:6000:29cf:b0:481:5829:3f28 with SMTP id
 ffacd0b85a97d-48159ed6b41mr6778867f8f.5.1786630495256; Thu, 13 Aug 2026
 07:14:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720032258.5188-1-xiaofengmian@163.com> <20260720032258.5188-3-xiaofengmian@163.com>
In-Reply-To: <20260720032258.5188-3-xiaofengmian@163.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 13 Aug 2026 15:14:26 +0100
X-Gm-Features: AUfX_mxkEJtvYLUcIuaN5m1I5DRHCK3p2rmLezGMhf-Znbx6IYzeyRitfT6Xq2w
Message-ID: <CA+V-a8tQK8rih9SGGTyqrEBGpNkx4H0eX2YccCRrgkVAPr+EBg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] riscv: patch: skip fixmap mapping when kernel text
 is already writable
To: Xiaofeng Yuan <xiaofengmian@163.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Nam Cao <namcao@linutronix.de>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Xiaofeng,

Thank you for the patch.

On Mon, Jul 20, 2026 at 5:19=E2=80=AFAM Xiaofeng Yuan <xiaofengmian@163.com=
> wrote:
>
> Currently patch_map() always creates a temporary writable mapping via
> fixmap for kernel text addresses, even when CONFIG_STRICT_MODULE_RWX
> is disabled and the kernel text is already mapped with _PAGE_WRITE.
>
> This is unnecessary overhead at best, and on minimal configurations
> it can cause page faults.
>
> Skip the fixmap path for kernel text when CONFIG_STRICT_MODULE_RWX
> is not enabled, since the text pages are already writable in this case.
>
> Signed-off-by: Xiaofeng Yuan <xiaofengmian@163.com>
> ---
> v2: add commit description
> v3: early return when !CONFIG_STRICT_MODULE_RWX (per Nam Cao's suggestion=
)
> diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
> index 16b243376f..caef41d5ef 100644
> --- a/arch/riscv/kernel/patch.c
> +++ b/arch/riscv/kernel/patch.c
> @@ -44,15 +44,16 @@ static __always_inline void *patch_map(void *addr, co=
nst unsigned int fixmap)
>         uintptr_t uintaddr =3D (uintptr_t) addr;
>         phys_addr_t phys;
>
> +       if (!IS_ENABLED(CONFIG_STRICT_MODULE_RWX))
> +               return addr;
> +
>         if (core_kernel_text(uintaddr) || is_kernel_exittext(uintaddr)) {
>                 phys =3D __pa_symbol(addr);
> -       } else if (IS_ENABLED(CONFIG_STRICT_MODULE_RWX)) {
> +       } else {
>                 struct page *page =3D vmalloc_to_page(addr);
>
>                 BUG_ON(!page);
>                 phys =3D page_to_phys(page) + offset_in_page(addr);
> -       } else {
> -               return addr;
>         }
>
With this patch applied and using renesas_defconfig I see below Oops
on SMARC RZ/Five.

[    0.012814] printk: legacy console [tty0] enabled
[    0.017634] Calibrating delay loop (skipped), value calculated
using timer frequency.. 24.00 BogoMIPS (lpj=3D48000)
[    0.027914] pid_max: default: 32768 minimum: 301
[    0.033876] Mount-cache hash table entries: 2048 (order: 2, 16384
bytes, linear)
[    0.041343] Mountpoint-cache hash table entries: 2048 (order: 2,
16384 bytes, linear)
[    0.049639] Unable to handle kernel paging request at virtual
address 0000006f89abce08
[    0.057617] Current swapper/0 pgtable: 4K pagesize, 39-bit VAs,
pgdp=3D0x00000000494f9000
[    0.065626] [0000006f89abce08] pgd=3D0000000000000000,
p4d=3D0000000000000000, pud=3D0000000000000000
[    0.074352] Oops [#1]
[    0.076635] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted
7.2.0-rc7-next-20260812 #21 PREEMPT
[    0.085494] Hardware name: Renesas SMARC EVK based on r9a07g043f01 (DT)
[    0.092096] epc : kmem_cache_alloc_lru_noprof+0x1a/0x1ba
[    0.097418]  ra : __d_alloc+0x42/0x188
[    0.101177] epc : ffffffff80162e20 ra : ffffffff8019874e sp :
ffffffff81203b30
[    0.108385]  gp : ffffffff812ec750 tp : ffffffff8120c780 t0 :
ffffffd60189db18
[    0.115593]  t1 : 0000000000000014 t2 : 0000000016e00403 s0 :
ffffffff81203b90
[    0.122809]  s1 : ffffffd601895800 a0 : 89abcdef89abcdef a1 :
ffffffd601895d10
[    0.130022]  a2 : 0000000000000cc0 a3 : 0000000000000002 a4 :
dead4ead00000001
[    0.137235]  a5 : 0000000000000000 a6 : 000000001de3521b a7 :
ffffffffac7f4a0c
[    0.144448]  s2 : 0000000000000000 s3 : ffffffd601895800 s4 :
0000000000000000
[    0.151660]  s5 : 0000000000000000 s6 : ffffffff812ed018 s7 :
00000000000003e8
[    0.158872]  s8 : 00000000000003e6 s9 : 0000000000000000 s10:
0000000077f29340
[    0.166084]  s11: 0000000000000000 t3 : ffffffffa0aed022 t4 :
0000000002018efb
[    0.173297]  t5 : 00000000101d5200 t6 : ffffffff81203b68 ssp :
0000000000000000
[    0.180596] status: 0000000200000120 badaddr: 0000006f89abce08
cause: 000000000000000d
[    0.188502] [<ffffffff80162e20>] kmem_cache_alloc_lru_noprof+0x1a/0x1ba
[    0.195116] [<ffffffff8019874e>] __d_alloc+0x42/0x188
[    0.200171] [<ffffffff801988fe>] d_alloc_anon+0xe/0x16
[    0.205314] [<ffffffff80198c90>] d_make_root+0x18/0x3a
[    0.210457] [<ffffffff8012792a>] shmem_fill_super+0x218/0x244
[    0.216210] [<ffffffff801865aa>] vfs_get_super+0x42/0x70
[    0.221525] [<ffffffff801865e8>] get_tree_nodev+0x10/0x18
[    0.226925] [<ffffffff80125e6a>] shmem_get_tree+0x14/0x1c
[    0.232327] [<ffffffff801845ba>] vfs_get_tree+0x1a/0xb0
[    0.237561] [<ffffffff801a1fa2>] fc_mount+0x10/0x32
[    0.242445] [<ffffffff801a2016>] vfs_kern_mount.part.0+0x34/0x5c
[    0.248451] [<ffffffff801a204c>] vfs_kern_mount+0xe/0x1a
[    0.253764] [<ffffffff801a206c>] kern_mount+0x14/0x26
[    0.258818] [<ffffffff8080f70a>] shmem_init+0xbe/0x150
[    0.263963] [<ffffffff8081973e>] mnt_init+0x128/0x314
[    0.269020] [<ffffffff80819316>] vfs_caches_init+0xa0/0xce
[    0.274507] [<ffffffff80800fa2>] start_kernel+0x754/0x7ac
[    0.279923] Code: 1080 e0ca ec86 fc4e f852 3783 5402 3423 fcf4 4781
(6783) 01c5
[    0.287344] ---[ end trace 0000000000000000 ]---
[    0.291986] Kernel panic - not syncing: Attempted to kill the idle task!


Reverting this patch fixed the issue.

Cheers,
Prabhakar


>         return (void *)set_fixmap_offset(fixmap, phys);
> --
> 2.43.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
