Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Wed, 15 Mar 2017 14:14:08 +1100
From: "Tobin C. Harding" <me@tobin.cc>
To: Matthew Giassa <matthew@giassa.net>
Cc: wsa@the-dreams.de, linux-renesas-soc@vger.kernel.org,
        gregkh@linuxfoundation.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCHv5 4/4] Staging: ks7010: ks_wlan_ioctl.h: Wrap complex
 macros with parentheses
Message-ID: <20170315031408.GA30949@eros>
References: <1487650805-30520-1-git-send-email-matthew@giassa.net>
 <1489544754-23840-1-git-send-email-matthew@giassa.net>
 <1489544754-23840-2-git-send-email-matthew@giassa.net>
 <1489544754-23840-3-git-send-email-matthew@giassa.net>
 <1489544754-23840-4-git-send-email-matthew@giassa.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1489544754-23840-4-git-send-email-matthew@giassa.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Mar 14, 2017 at 07:25:54PM -0700, Matthew Giassa wrote:
> Wrapping all complex macros with parentheses to resolve checkpatch
> errors. This change, along with the preceding changes in this change
> set, resolves all checkpatch warnings and errors for the file.
> 
> Signed-off-by: Matthew Giassa <matthew@giassa.net>
> ---
>  drivers/staging/ks7010/ks_wlan_ioctl.h | 64 +++++++++++++++++-----------------
>  1 file changed, 32 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/staging/ks7010/ks_wlan_ioctl.h b/drivers/staging/ks7010/ks_wlan_ioctl.h
> index 1251d7e..adc935d 100644
> --- a/drivers/staging/ks7010/ks_wlan_ioctl.h
> +++ b/drivers/staging/ks7010/ks_wlan_ioctl.h
> @@ -15,43 +15,43 @@
>  #include <linux/wireless.h>
>  /* The low order bit identify a SET (0) or a GET (1) ioctl.  */
>  
> -/*					SIOCIWFIRSTPRIV + 0 */
> -/* former KS_WLAN_GET_DRIVER_VERSION	SIOCIWFIRSTPRIV + 1 */
> -/*					SIOCIWFIRSTPRIV + 2 */
> -#define KS_WLAN_GET_FIRM_VERSION	SIOCIWFIRSTPRIV + 3
> +/*					(SIOCIWFIRSTPRIV + 0) */
> +/* former KS_WLAN_GET_DRIVER_VERSION	(SIOCIWFIRSTPRIV + 1) */
> +/*					(SIOCIWFIRSTPRIV + 2) */
> +#define KS_WLAN_GET_FIRM_VERSION	(SIOCIWFIRSTPRIV + 3)
>  #ifdef WPS
> -#define KS_WLAN_SET_WPS_ENABLE		SIOCIWFIRSTPRIV + 4
> -#define KS_WLAN_GET_WPS_ENABLE		SIOCIWFIRSTPRIV + 5
> -#define KS_WLAN_SET_WPS_PROBE_REQ	SIOCIWFIRSTPRIV + 6
> +#define KS_WLAN_SET_WPS_ENABLE		(SIOCIWFIRSTPRIV + 4)
> +#define KS_WLAN_GET_WPS_ENABLE		(SIOCIWFIRSTPRIV + 5)
> +#define KS_WLAN_SET_WPS_PROBE_REQ	(SIOCIWFIRSTPRIV + 6)
>  #endif
> -#define KS_WLAN_GET_EEPROM_CKSUM	SIOCIWFIRSTPRIV + 7
> -#define KS_WLAN_SET_PREAMBLE		SIOCIWFIRSTPRIV + 8
> -#define KS_WLAN_GET_PREAMBLE		SIOCIWFIRSTPRIV + 9
> -#define KS_WLAN_SET_POWER_SAVE		SIOCIWFIRSTPRIV + 10
> -#define KS_WLAN_GET_POWER_SAVE		SIOCIWFIRSTPRIV + 11
> -#define KS_WLAN_SET_SCAN_TYPE		SIOCIWFIRSTPRIV + 12
> -#define KS_WLAN_GET_SCAN_TYPE		SIOCIWFIRSTPRIV + 13
> -#define KS_WLAN_SET_RX_GAIN		SIOCIWFIRSTPRIV + 14
> -#define KS_WLAN_GET_RX_GAIN		SIOCIWFIRSTPRIV + 15
> -#define KS_WLAN_HOSTT			SIOCIWFIRSTPRIV + 16	/* unused */
> -//#define KS_WLAN_SET_REGION            SIOCIWFIRSTPRIV + 17
> -#define KS_WLAN_SET_BEACON_LOST		SIOCIWFIRSTPRIV + 18
> -#define KS_WLAN_GET_BEACON_LOST		SIOCIWFIRSTPRIV + 19
> +#define KS_WLAN_GET_EEPROM_CKSUM	(SIOCIWFIRSTPRIV + 7)
> +#define KS_WLAN_SET_PREAMBLE		(SIOCIWFIRSTPRIV + 8)
> +#define KS_WLAN_GET_PREAMBLE		(SIOCIWFIRSTPRIV + 9)
> +#define KS_WLAN_SET_POWER_SAVE		(SIOCIWFIRSTPRIV + 10)
> +#define KS_WLAN_GET_POWER_SAVE		(SIOCIWFIRSTPRIV + 11)
> +#define KS_WLAN_SET_SCAN_TYPE		(SIOCIWFIRSTPRIV + 12)
> +#define KS_WLAN_GET_SCAN_TYPE		(SIOCIWFIRSTPRIV + 13)
> +#define KS_WLAN_SET_RX_GAIN		(SIOCIWFIRSTPRIV + 14)
> +#define KS_WLAN_GET_RX_GAIN		(SIOCIWFIRSTPRIV + 15)
> +#define KS_WLAN_HOSTT			(SIOCIWFIRSTPRIV + 16) /* unused */
> +//#define KS_WLAN_SET_REGION            (SIOCIWFIRSTPRIV + 17)
> +#define KS_WLAN_SET_BEACON_LOST		(SIOCIWFIRSTPRIV + 18)
> +#define KS_WLAN_GET_BEACON_LOST		(SIOCIWFIRSTPRIV + 19)
>  
> -#define KS_WLAN_SET_TX_GAIN		SIOCIWFIRSTPRIV + 20
> -#define KS_WLAN_GET_TX_GAIN		SIOCIWFIRSTPRIV + 21
> +#define KS_WLAN_SET_TX_GAIN		(SIOCIWFIRSTPRIV + 20)
> +#define KS_WLAN_GET_TX_GAIN		(SIOCIWFIRSTPRIV + 21)
>  
>  /* for KS7010 */
> -#define KS_WLAN_SET_PHY_TYPE		SIOCIWFIRSTPRIV + 22
> -#define KS_WLAN_GET_PHY_TYPE		SIOCIWFIRSTPRIV + 23
> -#define KS_WLAN_SET_CTS_MODE		SIOCIWFIRSTPRIV + 24
> -#define KS_WLAN_GET_CTS_MODE		SIOCIWFIRSTPRIV + 25
> -/*					SIOCIWFIRSTPRIV + 26 */
> -/*					SIOCIWFIRSTPRIV + 27 */
> -#define KS_WLAN_SET_SLEEP_MODE		SIOCIWFIRSTPRIV + 28	/* sleep mode */
> -#define KS_WLAN_GET_SLEEP_MODE		SIOCIWFIRSTPRIV + 29	/* sleep mode */
> -/*					SIOCIWFIRSTPRIV + 30 */
> -/*					SIOCIWFIRSTPRIV + 31 */
> +#define KS_WLAN_SET_PHY_TYPE		(SIOCIWFIRSTPRIV + 22)
> +#define KS_WLAN_GET_PHY_TYPE		(SIOCIWFIRSTPRIV + 23)
> +#define KS_WLAN_SET_CTS_MODE		(SIOCIWFIRSTPRIV + 24)
> +#define KS_WLAN_GET_CTS_MODE		(SIOCIWFIRSTPRIV + 25)
> +/*					(SIOCIWFIRSTPRIV + 26) */
> +/*					(SIOCIWFIRSTPRIV + 27) */
> +#define KS_WLAN_SET_SLEEP_MODE		(SIOCIWFIRSTPRIV + 28) /* sleep mode */
> +#define KS_WLAN_GET_SLEEP_MODE		(SIOCIWFIRSTPRIV + 29) /* sleep mode */
> +/*					(SIOCIWFIRSTPRIV + 30) */
> +/*					(SIOCIWFIRSTPRIV + 31) */
>  
>  #ifdef __KERNEL__
>  
> -- 
> 2.7.4
> 
> _______________________________________________
> devel mailing list
> devel@linuxdriverproject.org
> http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel

Hi Matthew,

Sergei already mentioned the length of the subject line. If I may add
to what he said. 

You may want to make your subject line (about) maximum 50
characters. Also, while we are at it, you may like to wrap your git
log lines at 72 characters.

One other thing, are you using git send-email? Your patches are
chained together.

>From Documentation/process/5.Posting.rst

If you have a significant series of patches, it is customary to send
an introductory description as part zero.  This convention is not
universally followed though; if you use it, remember that information
in the introduction does not make it into the kernel changelogs.  So
please ensure that the patches, themselves, have complete changelog
information.

In general, the second and following parts of a multi-part patch
should be sent as a reply to the first part so that they all thread
together at the receiving end.  Tools like git and quilt have commands
to mail out a set of patches with the proper threading.  If you have a
long series, though, and are using git, please stay away from the
--chain-reply-to option to avoid creating exceptionally deep nesting.

Good luck,
Tobin.
