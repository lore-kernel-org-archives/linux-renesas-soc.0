Return-Path: <SRS0=Fsko=S3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFB24C43219
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 25 Apr 2019 19:22:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 223FD20652
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 25 Apr 2019 19:22:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mBKQ07lN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726125AbfDYTWq (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 25 Apr 2019 15:22:46 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:41054 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726020AbfDYTWq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Apr 2019 15:22:46 -0400
Received: by mail-lj1-f193.google.com with SMTP id k8so660748lja.8;
        Thu, 25 Apr 2019 12:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WPTWDWKCBkGfPSgSPT2bIo/0XXGhysj0HVhqcTTdXSE=;
        b=mBKQ07lNPaiwvWymLp2woapWenob7ZDcCCcSPZWVmfUkGBPsDm5Sce2+hIDC6Pud92
         viHklGZDuNyxZ5vTqiRZJf7k5E5crHwtVQJG2QSzAwiuBTNv5xAKQZ7DzZ3/dMYP3iyq
         N38PILlreDn8GTS0fUCURrLylRG4T/TTzbp2ZYRtSW1fiA0xcnV1P0bMdvlppClrW77Y
         BtDgiGMIS16DNP7zJOrV+zdFcO8wysKvWVPXth45JyF4h8gdC7LO2FmOxEqMkCk7GynU
         7iqmiP9kLRKz+wmgv6R73XTqg/i7gnfEN7Jnra+/EBiBSmGoEqWA/ly9yW7Z1IN+NDI4
         XgSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WPTWDWKCBkGfPSgSPT2bIo/0XXGhysj0HVhqcTTdXSE=;
        b=e2gfefQxaPX7Vdg9CS/JT+EVr3IWobbLVdWF2U74c1uf2dpJBxGK4twcpYAndzdZl7
         BhEkDy1Bcl/widHnOEU+MsH3pl+t/PU2Zxk06jdOYc+JN8YtakX6DCp7zjZXW2/jTsFj
         H22n869HBvIfRV2IGcsLx9QTQcTdVfByo/pYwzVLntHP5FnGu2XiRfslUPcH/wpL7T0M
         iwHkiNXzlS0fzGRo1hK7zRMnOROXAiR3LcZMifs+hWEtJ27JySUuN8snQef1gPdq3PvB
         jMSfwhw6zl2TqvjYo2X6NRH8+0Fq8KtilkKpGgbbd7xTNxFmQZZ5PIPsH9hGXbjYmMtW
         4I3w==
X-Gm-Message-State: APjAAAU6Ukss2ZmonjGNw0J+j2eNeUtjHzENGsmmfZTDfd+/55lwY9b2
        m654rxRIvh2gutQzzocH6KABpZtwtYU=
X-Google-Smtp-Source: APXvYqzgUUr5dy9YGr8I65YQ7mSA9ladKPzlI9wj+1UbVd7FWJjv+4YAZ/HSCcTpsO6Il8Grn6ZqTQ==
X-Received: by 2002:a2e:3207:: with SMTP id y7mr1459092ljy.117.1556220162548;
        Thu, 25 Apr 2019 12:22:42 -0700 (PDT)
Received: from [192.168.88.248] ([77.222.156.95])
        by smtp.gmail.com with ESMTPSA id h123sm4909091lfe.96.2019.04.25.12.22.41
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Apr 2019 12:22:41 -0700 (PDT)
Subject: Re: [PATCH RFT] i2c: designware: ratelimit 'transfer when suspended'
 errors
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-renesas-soc@vger.kernel.org
References: <20190424161632.4994-1-wsa+renesas@sang-engineering.com>
From:   skidnik <skidnik@gmail.com>
Message-ID: <1a8172c8-3d2e-1897-88dd-d86aa0130ed8@gmail.com>
Date:   Thu, 25 Apr 2019 22:21:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190424161632.4994-1-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 4/24/19 7:16 PM, Wolfram Sang wrote:
> There are two problems with dev_err() here. One: It is not ratelimited.
> Two: We don't see which driver tried to transfer something with a
> suspended adapter. Switch to dev_WARN_ONCE to fix both issues. Drawback
> is that we don't see if multiple drivers are trying to transfer while
> suspended. They need to be discovered one after the other now. This is
> better than a high CPU load because a really broken driver might try to
> resend endlessly.
> 
> Link: https://bugs.archlinux.org/task/62391
> Fixes: 275154155538 ("i2c: designware: Do not allow i2c_dw_xfer() calls while suspended")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> skdnik: Would you be so kind and test this patch? I can only build-test here.
> 
> I have a prototype to fix the similar issue in the core, but this needs more
> testing first, so I am sending this one out already.
> 
>   drivers/i2c/busses/i2c-designware-master.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
> index bb8e3f149979..d464799e40a3 100644
> --- a/drivers/i2c/busses/i2c-designware-master.c
> +++ b/drivers/i2c/busses/i2c-designware-master.c
> @@ -426,8 +426,7 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
>   
>   	pm_runtime_get_sync(dev->dev);
>   
> -	if (dev->suspended) {
> -		dev_err(dev->dev, "Error %s call while suspended\n", __func__);
> +	if (dev_WARN_ONCE(dev->dev, dev->suspended, "Transfer while suspended\n")) {
>   		ret = -ESHUTDOWN;
>   		goto done_nolock;
>   	}
> 
Patched, biult and tested. This is the new output:
---
[  285.441552] i2c_designware 808622C1:00: Transfer while suspended
[  285.441595] WARNING: CPU: 2 PID: 1966 at 
drivers/i2c/busses/i2c-designware-master.c:429 i2c_dw_xfer+0x23b/0x290
[  285.441597] Modules linked in: 8021q garp mrp stp llc ccm 
snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic 
hid_sensor_gyro_3d hid_sensor_incl_3d hid_sens
or_magn_3d hid_sensor_accel_3d hid_sensor_rotation hid_sensor_trigger 
industrialio_triggered_buffer kfifo_buf hid_sensor_iio_common 
industrialio btusb btrtl btbcm btintel
  bluetooth uvcvideo ecdh_generic joydev mousedev intel_rapl 
intel_powerclamp kvm_intel hid_rmi rmi_core kvm videobuf2_vmalloc 
videobuf2_memops videobuf2_v4l2 arc4 videobu
f2_common ofpart cmdlinepart videodev intel_spi_platform iwlmvm 
intel_spi mac80211 spi_nor media irqbypass iTCO_wdt iTCO_vendor_support 
i915 mtd nls_iso8859_1 crct10dif_p
clmul nls_cp437 iwlwifi crc32_pclmul vfat fat ghash_clmulni_intel 
wmi_bmof dell_wmi i2c_algo_bit snd_hda_intel drm_kms_helper dell_laptop 
ledtrig_audio snd_hda_codec dell
_smbios cfg80211 snd_hda_core aesni_intel dell_wmi_descriptor dcdbas 
snd_hwdep dell_smm_hwmon aes_x86_64 snd_pcm crypto_simd drm cryptd 
snd_timer glue_helper
[  285.441696]  intel_cstate psmouse pcspkr input_leds snd mei_txe 
tpm_crb soundcore intel_gtt mei agpgart lpc_ich i2c_i801 tpm_tis 
tpm_tis_core syscopyarea sysfillrect s
ysimgblt fb_sys_fops processor_thermal_device intel_xhci_usb_role_switch 
roles intel_soc_dts_iosf tpm wmi battery rng_core i2c_hid dell_rbtn 
evdev rfkill mac_hid pcc_cpuf
req ac soc_button_array intel_vbtn int3403_thermal int3400_thermal 
acpi_thermal_rel int340x_thermal_zone sparse_keymap coretemp msr 
crypto_user ip_tables x_tables ext4 cr
c32c_generic crc16 mbcache jbd2 sd_mod hid_sensor_hub hid_multitouch 
hid_generic usbhid hid serio_raw atkbd libps2 ahci libahci xhci_pci 
libata sdhci_pci crc32c_intel xhc
i_hcd cqhci scsi_mod sdhci mmc_core i8042 serio
[  285.441784] CPU: 2 PID: 1966 Comm: kworker/u8:56 Not tainted 
5.1.0-rc6-mainline-master-00064-gcd8dead0c394 #1
[  285.441788] Hardware name: Dell Inc. Inspiron 11-3168/0G70RP, BIOS 
2.3.0 01/31/2018
[  285.441796] Workqueue: events_unbound async_run_entry_fn
[  285.441804] RIP: 0010:i2c_dw_xfer+0x23b/0x290
[  285.441810] Code: 05 be 32 ca 00 01 48 85 ed 75 05 49 8b 6c 24 10 4c 
89 e7 e8 f7 b5 f4 ff 48 89 ea 48 c7 c7 90 a7 b1 86 48 89 c6 e8 3f 6a a1 
ff <0f> 0b bd 94 ff ff ff
4c 8b 23 e9 49 fe ff ff 83 f8 01 74 14 8b 83
[  285.441814] RSP: 0000:ffffb40a44d9fc70 EFLAGS: 00010282
[  285.441819] RAX: 0000000000000000 RBX: ffff9e313a4d8818 RCX: 
0000000000000000
[  285.441822] RDX: 0000000000000000 RSI: 0000000000000096 RDI: 
00000000ffffffff
[  285.441824] RBP: ffff9e313a4bc640 R08: 0000000000000000 R09: 
0000000000021500
[  285.441828] R10: 000000097a05f1bc R11: 0000000000010148 R12: 
ffff9e313a4ea810
[  285.441831] R13: ffff9e313a4d88c8 R14: 00000000ffffee52 R15: 
ffff9e313a4fb000
[  285.441835] FS:  0000000000000000(0000) GS:ffff9e313bb00000(0000) 
knlGS:0000000000000000
[  285.441838] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  285.441840] CR2: 0000000000000000 CR3: 000000002b60e000 CR4: 
00000000001006e0
[  285.441844] Call Trace:
[  285.441860]  __i2c_transfer+0x153/0x4a0
[  285.441868]  i2c_transfer+0x51/0xc0
[  285.441881]  __i2c_hid_command+0x1ed/0x2c0 [i2c_hid]
[  285.441889]  ? finish_wait+0x2f/0x60
[  285.441897]  ? _raw_spin_unlock_irqrestore+0x20/0x40
[  285.441902]  ? async_synchronize_cookie_domain+0xdf/0x150
[  285.441907]  ? wait_woken+0x80/0x80
[  285.441915]  ? chv_gpio_irq_mask_unmask+0x2b/0xb0
[  285.441923]  i2c_hid_set_power+0x6c/0x100 [i2c_hid]
[  285.441931]  i2c_hid_resume+0x85/0x100 [i2c_hid]
[  285.441939]  ? i2c_hid_runtime_resume+0x30/0x30 [i2c_hid]
[  285.441945]  dpm_run_callback+0x4f/0x180
[  285.441953]  device_resume+0xac/0x1f0
[  285.441959]  async_resume+0x19/0x30
[  285.441964]  async_run_entry_fn+0x37/0x140
[  285.441972]  process_one_work+0x1eb/0x410
[  285.441980]  worker_thread+0x2d/0x3d0
[  285.441986]  ? process_one_work+0x410/0x410
[  285.441991]  kthread+0x112/0x130
[  285.441997]  ? kthread_park+0x80/0x80
[  285.442003]  ret_from_fork+0x35/0x40
[  285.442013] ---[ end trace c98b327600d4a21b ]---
[  285.442042] i2c_hid i2c-DELL074D:00: failed to change power setting.
[  285.442051] PM: dpm_run_callback(): i2c_hid_resume+0x0/0x100 
[i2c_hid] returns -108
[  285.442063] PM: Device i2c-DELL074D:00 failed to restore async: error 
-108
---
outputs this once.
Full dmesg from boot to resume from hibernation: 
https://pastebin.com/raw/9akVTHL4
sorry for the weird kernel naming.
This solves system journal flooding, but I still have one core under 
full load after resume from hibernation. The touchpad attached to that 
bus works perfectly fine after resume.
